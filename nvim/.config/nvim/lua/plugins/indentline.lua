local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  commit = "005b56001b2cb30bfa61b7986bc50657816ba4ba",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
    },
    scope = {
      char = "│",
      show_start = false,
      show_end = false,
    },
  },
}

return M
