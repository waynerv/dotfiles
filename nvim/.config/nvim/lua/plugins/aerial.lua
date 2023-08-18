local M = {
  "stevearc/aerial.nvim",
  commit = "de460a4a29491af46eaf2108e6f7534c7b66c4a0",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "AerialToggle" },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial Outline" },
  },
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = { width = 30 },
  },
}

return M
