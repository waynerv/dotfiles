local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "a56bf0071bf63d35274fdc4738bb1e8821cfd2ea",
    },
    { "williamboman/mason.nvim", commit = "d66c60e17dd6fd8165194b1d14d21f7eb2c1697a" },
    { "jose-elias-alvarez/null-ls.nvim", commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" },
  },
}

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    sources = {
      formatting.black.with { extra_args = { "--fast" } },
      formatting.stylua,
      formatting.shfmt,
      formatting.goimports_reviser,
      diagnostics.flake8,
      diagnostics.shellcheck,
    },
  }
  require("mason-null-ls").setup {
    ensure_installed = nil,
    automatic_installation = true,
  }
end

return M
