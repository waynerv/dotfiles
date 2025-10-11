return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    commit = "3277ad5f96eb03c9d618c88e24f683e4364e578c",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "as", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      end)
      vim.keymap.set("n", "<leader>sa", function()
        require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
      end)
      vim.keymap.set("n", "<leader>sA", function()
        require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
      end)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    lazy = vim.fn.argc(-1) == 0,
    build = ":TSUpdate",
    config = function()
      -- put the language you want in this array
      local ensure_installed =
        { "bash", "c", "dockerfile", "go", "gomod", "lua", "markdown", "markdown_inline", "python", "regex" }
      local alreadyInstalled = require("nvim-treesitter.config").get_installed()
      local parsersToInstall = vim
        .iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
      require("nvim-treesitter").install(parsersToInstall)

      local parsersInstalled = require("nvim-treesitter.config").get_installed "parsers"
      for _, parser in pairs(parsersInstalled) do
        local filetypes = vim.treesitter.language.get_filetypes(parser)
        vim.api.nvim_create_autocmd({ "FileType" }, {
          pattern = filetypes,
          callback = function(event)
            local max_filesize = 1024 * 1024 -- 1 MB
            local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(event.buf))
            if size < max_filesize then
              vim.treesitter.start()
            end
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end,
        })
      end
    end,
  },
}
