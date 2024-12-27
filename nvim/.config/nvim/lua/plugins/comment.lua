local M = {
  "numToStr/Comment.nvim",
  commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
  keys = {
    { "gc", mode = { "n", "x" } },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f",
    },
  },
}

function M.config()
  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M
