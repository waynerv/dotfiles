local M = {
  "rebelot/kanagawa.nvim",
  commit = "aef7f5cec0a40dbe7f3304214850c472e2264b10",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("kanagawa").setup {
    compile = false, -- enable compiling the colorscheme
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors) -- add/modify highlights
      local theme = colors.theme
      return {
        -- SnacksDashboard
        SnacksDashboardHeader = { fg = theme.vcs.removed },
        SnacksDashboardFooter = { fg = theme.syn.comment },
        SnacksDashboardDesc = { fg = theme.syn.identifier },
        SnacksDashboardIcon = { fg = theme.ui.special },
        SnacksDashboardKey = { fg = theme.syn.special1 },
        SnacksDashboardSpecial = { fg = theme.syn.comment },
        SnacksDashboardDir = { fg = theme.syn.identifier },
        -- SnacksIndent
        SnacksIndent = { fg = theme.ui.bg_p2, nocombine = true },
        SnacksIndentScope = { fg = colors.palette.springViolet1, nocombine = true },
        -- SnacksInput
        SnacksInputIcon = { fg = theme.syn.statement },
        SnacksInputBorder = { fg = theme.syn.identifier },
        SnacksInputTitle = { fg = theme.syn.identifier },
        -- SnacksPicker
        SnacksPickerInputBorder = { fg = theme.syn.constant },
        SnacksPickerInputTitle = { fg = theme.syn.constant },
        SnacksPickerBoxTitle = { fg = theme.syn.constant },
        SnacksPickerSelected = { fg = theme.syn.number },
        SnacksPickerToggle = { link = "SnacksProfilerBadgeInfo" },
        SnacksPickerPickWinCurrent = { fg = theme.ui.fg, bg = theme.syn.number, bold = true },
        SnacksPickerPickWin = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = true },
      }
    end,
    theme = "wave", -- Load "wave" theme
  }

  vim.cmd "colorscheme kanagawa"
end

return M
