local M = {
  "ojroques/nvim-osc52",
  commit = "5689dc08ee1ade3feb7f74bdd6e539fba70f3064",
  keys = {
    { "<leader>c", mode = {"n", "v"}, desc = "Copy with osc52" },
  },
  config = function ()
    vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
    vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
    vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
  end
}

return M
