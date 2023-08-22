local M = {
  "akinsho/bufferline.nvim",
  commit = "d24378edc14a675c820a303b4512af3bbc5761e9",
  event = { "BufReadPre", "BufAdd", "BufNewFile" },
  dependencies = {
    {
      "famiu/bufdelete.nvim",
      commit = "07d1f8ba79dec59d42b975a4df1c732b2e4e37b4",
    },
  },
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" } },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" } },
    { "<S-q>", "<cmd>Bdelete<cr>", { desc = "Close buffer" } },
  },
}

function M.config()
  require("bufferline").setup {
    options = {
      close_command = function(n) require("bufdelete").bufdelete(n, false) end, -- can be a string | function, see "Mouse actions"
      right_mouse_command = function(n) require("bufdelete").bufdelete(n, false) end, -- can be a string | function, see "Mouse actions"
      offsets = { { filetype = "NvimTree", text = "Explorer", separator = true, highlight = "NvimTreeNormal" } },
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      buffer_close_icon = "✕",
    },
    highlights = {
      indicator_selected = {
        fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      offset_separator = {
        fg = { attribute = "fg", highlight = "WinSeparator" },
        bg = { attribute = "bg", highlight = "WinSeparator" },
      },
    },
  }
end

return M
