local M = {
  "stevearc/conform.nvim",
  commit = "0e93e0d12d2f7ebdea9e3e444dfaff0050cefbe6",
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
