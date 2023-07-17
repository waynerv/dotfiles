local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.setup()
  wk.register {
    ["<leader>"] = {
      f = { name = "Find" },
      g = { name = "Gitsigns" },
      l = { name = "LSP" },
      t = { name = "Toggle" },
    },
  }
end

return M
