local M = {
  "lewis6991/gitsigns.nvim",
  commit = "d0f90ef51d4be86b824b012ec52ed715b5622e51",
  event = "VeryLazy",
}

M.opts = {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "󰐊" },
    topdelete = { text = "󰐊" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    map("n", "<leader>gn", gs.next_hunk, "Next Hunk")
    map("n", "<leader>gp", gs.prev_hunk, "Prev Hunk")
    map({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk")
    map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk")
    map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
    map("n", "<leader>gk", gs.preview_hunk, "Preview Hunk")
    map("n", "<leader>gb", function()
      gs.blame_line { full = true }
    end, "Blame Line")
    map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle blame line")
    map("n", "<leader>gd", gs.diffthis, "Diff This")
    map("n", "<leader>gD", function()
      gs.diffthis "~"
    end, "Diff This ~")
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<cr>", "GitSigns Select Hunk")
  end,
}

return M
