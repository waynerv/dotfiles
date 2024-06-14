local M = {
  "folke/which-key.nvim",
  commit = "4b7167f8fb2dba3d01980735e3509e172c024c29",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.setup()
  wk.register {
    ["<leader>"] = {
      f = { "Find" },
      g = { "Gitsigns" },
      l = { "LSP" },
      s = { "Swap" },
      t = { "Toggle" },
    },
  }
end

return M
