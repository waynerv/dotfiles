local M = {
  "ojroques/nvim-osc52",
  commit = "04cfaba1865ae5c53b6f887c3ca7304973824fb2",
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
