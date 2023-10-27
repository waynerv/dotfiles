local M = {
  "nvim-telescope/telescope.nvim",
  commit = "276362a8020c6e94c7a76d49aa00d4923b0c02f3",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-lua/plenary.nvim",
      commit = "9ce85b0f7dcfe5358c0be937ad23e456907d410b",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      commit = "6c921ca12321edaa773e324ef64ea301a1d0da62",
      build = "make",
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep files" },
    { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects" },
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>", desc = "Buffers" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
    { "<leader>fB", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
    { "<leader>fc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
    { "<leader>fC", "<cmd>Telescope git_bcommits<CR>", desc = "Commits(bufnr=0)" },
    {
      "<leader>fG",
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        }
      end,
      desc = "Grep all files",
    },
    {
      "<leader>fR",
      function()
        require("telescope.builtin").oldfiles(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
          cwd = vim.loop.cwd(),
        })
      end,
      desc = "Recent files(cwd)",
    },
    {
      "<leader>/",
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = "Fuzzy search(bufnr=0)",
    },
  },
}

function M.config()
  local telescope = require "telescope"
  local actions = require "telescope.actions"
  telescope.setup {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },
      mappings = {
        i = {
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-f>"] = actions.preview_scrolling_down,
          ["<C-b>"] = actions.preview_scrolling_up,
        },
        n = {
          ["q"] = actions.close,
        },
      },
    },
  }
  telescope.load_extension "projects"
  telescope.load_extension "fzf"
end

return M
