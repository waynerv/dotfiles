local M = {
  "numToStr/Comment.nvim",
  commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
    },
  },
}

function M.config()
  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M
