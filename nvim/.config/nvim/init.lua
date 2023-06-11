-- nvim-tree reconmand to disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General Options
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Mappings
vim.keymap.set('n', ' ', '')
vim.g.mapleader = ' '

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

-- Plugin List
require("lazy").setup({

  {"olimorris/onedarkpro.nvim", priority = 1000},

  {"nvim-tree/nvim-web-devicons", lazy = true},

  "nvim-lualine/lualine.nvim",

  "nvim-tree/nvim-tree.lua",

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  "ggandor/leap.nvim",

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    }
  },

  {'akinsho/bufferline.nvim'},

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        -- config
      }
    end,
  },

  {'akinsho/toggleterm.nvim', version = "*", config = true},

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        -- config
      }
    end,
  },

})

-- Set colorscheme
vim.cmd.colorscheme("onedark")
vim.cmd.highlight({ "CursorLine", "guibg=#333841" })

-- Plugin settings
require('nvim-tree').setup()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "go", "python", "bash" },

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

require('leap').add_default_mappings()

-- LSP
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

require("bufferline").setup{}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

