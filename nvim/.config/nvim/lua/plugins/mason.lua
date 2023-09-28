local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "20fd7f50f34b59031a7c3bbc2c207f4f60037628",
  cmd = "Mason",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "d66c60e17dd6fd8165194b1d14d21f7eb2c1697a",
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
end

return M
