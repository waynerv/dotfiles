local M = {
  "folke/which-key.nvim",
  commit = "bf09a25bdc9a83bcc69d2cf078e680368676513b",
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
      s = { name = "Swap" },
      t = { name = "Toggle" },
    },
  }
end

return M
