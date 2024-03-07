local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "21d33d69a81f6351e5a5f49078b2e4f0075c8e73",
  cmd = "Mason",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "c43eeb5614a09dc17c03a7fb49de2e05de203924",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      commit = "1212fb6082b7177dde17ea65e429e027835aeb40",
    },
  },
}

function M.config()
  require("mason").setup {
    ui = {
      border = "none",
      icons = {
        package_installed = "◍",
        package_pending = "◍",
        package_uninstalled = "◍",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  }
  require("mason-lspconfig").setup {
    ensure_installed = require("lspsettings").servers,
    automatic_installation = false,
  }
  require("mason-tool-installer").setup {
    ensure_installed = {
      "goimports-reviser",
      "shellcheck",
      "shfmt",
      "staticcheck",
      "stylua",
    },
  }
end

return M
