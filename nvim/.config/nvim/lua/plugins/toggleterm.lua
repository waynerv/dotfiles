local M = {
  "akinsho/toggleterm.nvim",
  commit = "066cccf48a43553a80a210eb3be89a15d789d6e6",
  cmd = "ToggleTerm",
  keys = {
    { [[<C-\>]] },
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Toggle lazygit" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
  },
}

function M.config()
  require("toggleterm").setup {
    size = 15,
    open_mapping = [[<c-\>]],
    on_open = function(term)
      vim.wo.foldcolumn = "0"
    end,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
    },
  }

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
  end

  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", direction = "float", hidden = true }

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end
end

return M
