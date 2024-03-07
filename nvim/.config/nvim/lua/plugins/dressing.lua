local M = {
  "stevearc/dressing.nvim",
  commit = "6f212262061a2120e42da0d1e87326e8a41c0478",
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.select(...)
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.input(...)
    end
  end,
  opts = {
    input = { default_prompt = "➤ " },
    select = { backend = { "telescope", "builtin" } },
  },
}

return M
