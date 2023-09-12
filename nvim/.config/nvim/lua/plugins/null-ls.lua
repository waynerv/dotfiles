local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "a56bf0071bf63d35274fdc4738bb1e8821cfd2ea",
    },
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
end

return M
