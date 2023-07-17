local M = {
  "ahmedkhalf/project.nvim",
  commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
  event = "VeryLazy",
  cmd = "Telescope projects",
  config = function()
    require("project_nvim").setup {
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "go.mod", "package.json" },
    }
  end,
}

return M
