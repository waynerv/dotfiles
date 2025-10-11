local M = {
  "stevearc/conform.nvim",
  commit = "fbcb4fa7f34bfea9be702ffff481a8e336ebf6ed",
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
      ["goimports-reviser"] = {
        prepend_args = { "-company-prefixes", "gitlab.woqutech.com" },
      },
    },
  },
}

return M
