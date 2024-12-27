local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "2daa8921b7afdcfa47419a21ea343c3df6d74fa0",
  cmd = "Mason",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "e2f7f9044ec30067bc11800a9e266664b88cda22",
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
