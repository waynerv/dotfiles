local M = {
  "stevearc/conform.nvim",
  commit = "34b81e70da83e26c048290204de44268eb59814e",
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
