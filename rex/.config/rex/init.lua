-- Match tmux/.config/tmux/tmux.conf and herdr/.config/herdr/config.toml
-- where Rex has an equivalent action.
-- https://www.superlogical.com/rex/docs/customize/key-sequences
local prefix = "ctrl+space>"

local function prefix_bind(key, action, args)
  rex.bind(prefix .. key, action, args)
end

-- Press the prefix twice to send Ctrl+Space to the terminal.
prefix_bind("ctrl+space", "pane.send_key", { key = "ctrl+space" })
prefix_bind("r", "client.config.reload")
prefix_bind("b", "client.sidebar.toggle")

-- Enter with prefix+w to cycle through all tabs across sessions.
-- Keep j/k active until Escape or Enter is pressed.
rex.mode("tabs", { exclusive = true })
prefix_bind("w", "client.mode.enter", { name = "tabs" })
prefix_bind("g", "session.switch")
rex.bind("tabs/j", "client.tab.next")
rex.bind("tabs/k", "client.tab.previous")
rex.bind("tabs/enter", "client.mode.exit")
prefix_bind("shift+n", "session.new")
prefix_bind("shift+x", "session.close")

-- Tabs. Rex tab indices start at 1, just like the herdr bindings.
prefix_bind("c", "client.tab.new")
prefix_bind(",", "client.tab.rename")
-- Use the session API to wrap within the current session's tabs only.
for key, direction in pairs({ n = "next", p = "previous" }) do
  local name = "tab_" .. direction .. "_in_session"
  local method = "focus_" .. direction .. "_window"
  rex.action({
    name = name,
    title = "Switch tab in current session: " .. direction,
    run = function(ctx)
      local result, err = rex.session[method]({
        session_id = assert(ctx.session_id, "No current session"),
        wrap = true,
      })
      assert(result, err)
      -- Explicitly select the server's active tab in the invoking client too.
      local view, view_err = rex.session.view({ session_id = ctx.session_id })
      assert(view, view_err)
      rex.client.queue("session.select", {
        session_id = ctx.session_id,
        window_id = assert(view.active_window_id, "No active tab"),
      })
    end,
  })
  prefix_bind(key, name)
  prefix_bind("ctrl+" .. key, name)
end
for index = 1, 9 do
  prefix_bind(tostring(index), "client.tab.goto", { index = index })
end
prefix_bind("shift+7", "client.tab.close") -- & on a US layout

-- Panes. Rex matches unshifted keys plus modifiers, not % or " directly.
prefix_bind("shift+5", "pane.split", { direction = "right" }) -- %
prefix_bind("shift+'", "pane.split", { direction = "down" }) -- "
prefix_bind("x", "pane.close")
prefix_bind("z", "pane.zoom")
prefix_bind("shift+r", "client.mode.enter", { name = "resize" })

-- Tmux-style pane navigation and direct resizing. Rex resize amounts are
-- percentages of the split, rather than tmux's terminal cell counts.
local directions = {
  h = "left",
  j = "down",
  k = "up",
  l = "right",
}
for key, direction in pairs(directions) do
  prefix_bind(key, "pane.focus", { direction = direction })
  prefix_bind("shift+" .. key, "pane.resize", { direction = direction, amount = 5 })
end

-- Use this mode for repeated resizing without re-entering the prefix.
-- h/j/k/l and arrows resize; Shift takes larger steps.
-- Escape, Enter, or q leaves the mode.
rex.mode("resize", { exclusive = true })
for key, direction in pairs(directions) do
  for _, resize_key in ipairs({ key, direction }) do
    rex.bind("resize/" .. resize_key, "pane.resize", { direction = direction })
    rex.bind("resize/shift+" .. resize_key, "pane.resize", { direction = direction, amount = 15 })
  end
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")
rex.bind("resize/q", "client.mode.exit")

-- Rex Beta 0.1.0 (1408) has no native actions for tmux's last session/tab
-- (Shift+S / Space), copy mode (Escape, then v/y/r), paste-buffer (Shift+P),
-- or synchronize-panes (e). Herdr's detach (d), next_agent (a), and global
-- last_pane also have no equivalents. Leave these unbound.
-- Escape remains Rex's sequence/mode cancel key.
