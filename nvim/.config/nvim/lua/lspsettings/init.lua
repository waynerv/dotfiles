local M = {}

M.servers = {
  "lua_ls",
  "pyright",
  "bashls",
  "yamlls",
  "gopls",
}

-- Non-LSP linters or formatters
M.packages = {
  "stylua",
  "shellcheck",
  "shfmt",
  "goimports-reviser",
}

return M
