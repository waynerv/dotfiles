local M = {
  "numToStr/Comment.nvim",
  commit = "eab2c83a0207369900e92783f56990808082eac2",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
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
