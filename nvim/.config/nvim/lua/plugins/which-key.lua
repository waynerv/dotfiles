local M = {
  "folke/which-key.nvim",
  commit = "b4177e3eaf15fe5eb8357ebac2286d488be1ed00",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>f", group = "Files" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>s", group = "Search" },
    { "<leader>t", group = "Toggle" },
  }
end

return M
