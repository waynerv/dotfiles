local M = {
  "SmiteshP/nvim-navbuddy",
  commit = "46670b27a21ae26d25d3ee2b71f31729162f9de7",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "SmiteshP/nvim-navic", commit = "9c89730da6a05acfeb6a197e212dfadf5aa60ca0" },
    { "MunifTanjim/nui.nvim", commit = "0f913a3ae1a24c8a4487fbf111b4044cc22b1b0d" },
  },
  keys = {
    { "<leader>n", "<cmd>Navbuddy<cr>", desc = "Navigator", silent = true },
  },
}

M.config = function()
  require("nvim-navbuddy").setup {
    window = { border = "rounded" },
    lsp = { auto_attach = true },
    icons = require("utils").nav_icons,
  }
  vim.api.nvim_set_hl(0, "NavbuddyName", { fg = "#DCD7BA", bold = true })
end

return M
