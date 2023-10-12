local M = {
  "stevearc/dressing.nvim",
  commit = "1f2d1206a03bd3add8aedf6251e4534611de577f",
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
