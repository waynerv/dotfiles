local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "20fd7f50f34b59031a7c3bbc2c207f4f60037628",
  cmd = "Mason",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "41e75af1f578e55ba050c863587cffde3556ffa6",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      commit = "e4f34741daa9cf95de68a603d3e7a6844a69fdf0",
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
