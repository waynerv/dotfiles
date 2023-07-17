local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
  event = { "BufReadPost", "BufNewFile" },
}

M.opts = {
  char = "▏",
  context_char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = require("utils").ignore_buftypes,
  filetype_exclude = require("utils").ignore_filetypes,
}

return M
