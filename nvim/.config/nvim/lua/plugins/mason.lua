local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "bef29b653ba71d442816bf56286c2a686210be04",
  cmd = "Mason",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "8024d64e1330b86044fed4c8494ef3dcd483a67c",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      commit = "93a9ff9b34c91c0cb0f7de8d5f7e4abce51d8903",
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
    automatic_enable = false,
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
