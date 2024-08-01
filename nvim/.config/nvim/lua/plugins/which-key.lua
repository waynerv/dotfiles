local M = {
  "folke/which-key.nvim",
  commit = "6c1584eb76b55629702716995cca4ae2798a9cca",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Gitsigns" },
    { "<leader>l", group = "LSP" },
    { "<leader>s", group = "Swap" },
    { "<leader>t", group = "Toggle" },
  }
end

return M
