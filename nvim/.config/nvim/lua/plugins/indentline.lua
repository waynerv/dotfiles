local M = {
  "lukas-reineke/indent-blankline.nvim",
  version = "2.20.8",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    char = "▏",
    context_char = "▏",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    filetype = require("utils").enhance_filetypes,
    buftype_exclude = require("utils").ignore_buftypes,
    filetype_exclude = require("utils").ignore_filetypes,
  },
}

return M
