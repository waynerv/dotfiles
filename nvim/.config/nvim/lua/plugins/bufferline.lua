local M = {
  "akinsho/bufferline.nvim",
  commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3",
  event = { "BufReadPre", "BufAdd", "BufNewFile" },
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" } },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" } },
    { "<S-q>", function(n) Snacks.bufdelete(n) end, { desc = "Close buffer" } },
  },
}

function M.config()
  require("bufferline").setup {
    options = {
      close_command = function(n) Snacks.bufdelete(n) end, -- can be a string | function, see "Mouse actions"
      right_mouse_command = function(n) Snacks.bufdelete(n) end, -- can be a string | function, see "Mouse actions"
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
