local M = {
  "stevearc/dressing.nvim",
  commit = "3a45525bb182730fe462325c99395529308f431e",
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
