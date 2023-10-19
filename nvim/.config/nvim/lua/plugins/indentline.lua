local M = {
  "lukas-reineke/indent-blankline.nvim",
  version = "2.20.8",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    char = "▏",
    context_char = "▏",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = false,
    show_current_context = false,
    filetype = require("utils").enhance_filetypes,
    buftype_exclude = require("utils").ignore_buftypes,
    filetype_exclude = require("utils").ignore_filetypes,
  },
}

return M
