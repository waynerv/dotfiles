local M = {
  "akinsho/bufferline.nvim",
  commit = "261a72b90d6db4ed8014f7bda976bcdc9dd7ce76",
  event = { "BufReadPre", "BufAdd", "BufNewFile" },
  dependencies = {
    {
      "famiu/bufdelete.nvim",
      commit = "f6bcea78afb3060b198125256f897040538bcb81",
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
