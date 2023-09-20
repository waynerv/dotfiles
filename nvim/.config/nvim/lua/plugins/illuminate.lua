local M = {
  "RRethy/vim-illuminate",
  commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("illuminate").configure {
    delay = 300,
    filetypes_denylist = {},
    filetypes_allowlist = require("utils").enhance_filetypes,
    under_cursor = true,
    large_file_cutoff = 5000,
    large_file_overrides = {
      -- disable treesitter in large file for performance
      providers = { "lsp" },
    },
  }

  -- use illuminate instead of underline
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "LspReferenceText" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceText" })
end

return M
