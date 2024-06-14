local M = {
  "stevearc/conform.nvim",
  commit = "88b699b595703f1ae9d9061c050e52b1fe7c33f1",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      sh = { "shfmt" },
      go = { "goimports-reviser" },
      lua = { "stylua" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "4" },
      },
    },
  },
}

return M
