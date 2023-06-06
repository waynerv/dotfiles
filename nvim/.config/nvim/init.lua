-- nvim-tree reconmand to disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Mappings
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

vim.keymap.set('i', 'jj', '<Esc>')

-- Plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  "nvim-lualine/lualine.nvim",

  {"nvim-tree/nvim-web-devicons", lazy = true},

  "nvim-tree/nvim-tree.lua",

  "olimorris/onedarkpro.nvim",

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  "justinmk/vim-sneak",

})

-- Plugin settings
vim.cmd.colorscheme("onedark")

require('nvim-tree').setup()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "go", "python", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

-- always load lualine after colorscheme
require('lualine').setup()

