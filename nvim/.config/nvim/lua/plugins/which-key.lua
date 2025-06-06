local M = {
  "folke/which-key.nvim",
  commit = "370ec46f710e058c9c1646273e6b225acf47cbed",
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
