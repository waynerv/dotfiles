local M = {
  "stevearc/conform.nvim",
  commit = "339b3e4519ec49312d34fcfa275aa15bfaa67025",
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
