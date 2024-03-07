local M = {
  "ojroques/nvim-osc52",
  commit = "1aa814582a8ab76e85492edc0e719deaa90552e8",
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
