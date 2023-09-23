local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "2aa9e9b0e655462890c6d2d8632a0d569be66482",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
    },
    {
      "HiPhish/nvim-ts-rainbow2",
      commit = "09214437d00b2e6863f95578d72abe5bca2d0f6b"
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      commit = "9e519b6146512c8e2e702faf8ac48420f4f5deec"
    },
  },
}

function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "bash", "c", "dockerfile", "go", "gomod", "lua", "markdown", "markdown_inline", "python" }, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" },                                                       -- List of parsers to ignore installing
    sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
        return lang == "css"
      end,
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },

    rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      disable = { 'jsx', 'cpp' },
      -- Which query to use for finding delimiters
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = require('ts-rainbow').strategy.global,
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ak"] = "@block.outer",
          ["ik"] = "@block.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["a?"] = "@conditional.outer",
          ["i?"] = "@conditional.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>sk"] = { query = "@block.outer", desc = "Swap next block" },
          ["<leader>sf"] = { query = "@function.outer", desc = "Swap next function" },
          ["<leader>sa"] = { query = "@parameter.inner", desc = "Swap next parameter" },
        },
        swap_previous = {
          ["<leader>sK"] = { query = "@block.outer", desc = "Swap previous block" },
          ["<leader>sF"] = { query = "@function.outer", desc = "Swap previous function" },
          ["<leader>sA"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
        },
      },
    }
  }
end

return M
