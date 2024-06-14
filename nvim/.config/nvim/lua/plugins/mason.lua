local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "a4caa0d083aab56f6cd5acf2d42331b74614a585",
  cmd = "Mason",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "0950b15060067f752fde13a779a994f59516ce3d",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      commit = "c5e07b8ff54187716334d585db34282e46fa2932",
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
