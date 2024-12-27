local M = {
  "folke/which-key.nvim",
  commit = "8ab96b38a2530eacba5be717f52e04601eb59326",
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
