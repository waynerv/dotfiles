return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    commit = "0f314613125fdd7c85faaee3c87051611d883253",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "fd41b7ccc5490a3a99c734d1ee418b68d06c48a9",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "979beffc1a86e7ba19bd6535c0370d8e1aaaad3c",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "bash", "c", "dockerfile", "go", "gomod", "lua", "markdown", "markdown_inline", "python" }, -- put the language you want in this array
        -- ensure_installed = "all", -- one of "all" or a list of languages
        ignore_install = { "" }, -- List of parsers to ignore installing
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

        highlight = {
          enable = true, -- false will disable the whole extension
          disable = function(lang, buf)
            local max_filesize = 1024 * 1024 -- 1 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
            return lang == "css"
          end,
        },

        indent = {
          enable = true,
          disable = { "python", "css" },
        },

        autopairs = {
          enable = true,
        },

        context_commentstring = {
          enable = true,
          enable_autocmd = false,
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
        },
      }
    end,
  },
}
