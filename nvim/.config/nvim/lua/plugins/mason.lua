local M = {
  "williamboman/mason.nvim",
  commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
  cmd = "Mason",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
    },
  },
}

local settings = {
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

function M.config()
  require("mason").setup(settings)
  require("mason-lspconfig").setup {
    ensure_installed = require("lspsettings").servers,
    automatic_installation = true,
  }

  local registry = require("mason-registry")
  local pkgs = require("lspsettings").packages

  for _, pkg_name in ipairs(pkgs) do
    local ok, pkg = pcall(registry.get_package, pkg_name)
    if ok then
      if not pkg:is_installed() then
         pkg:install()
      end
    end
  end
end

return M
