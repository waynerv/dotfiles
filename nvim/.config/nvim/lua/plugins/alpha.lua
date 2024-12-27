local M = {
  "goolord/alpha-nvim",
  commit = "de72250e054e5e691b9736ee30db72c65d560771",
  event = "VimEnter",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }
  dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
    dashboard.button("e", " " .. " New file", "<cmd>ene <BAR> startinsert <CR>"),
    dashboard.button("p", " " .. " Find project", "<cmd>lua require('telescope').extensions.projects.projects()<CR>"),
    dashboard.button("r", "󰄉 " .. " Recent files", "<cmd>Telescope oldfiles <CR>"),
    dashboard.button("t", " " .. " Find text", "<cmd>Telescope live_grep <CR>"),
    dashboard.button("c", " " .. " Config", "<cmd>e $MYVIMRC <CR>"),
    dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy <CR>"),
    dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
  }
  local function footer()
    local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    local site = " 󰥱 waynerv.com"
    return version .. "\t" .. site
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)
end

return M
