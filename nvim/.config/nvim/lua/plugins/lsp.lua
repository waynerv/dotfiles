return {
  {
    "SmiteshP/nvim-navbuddy",
    commit = "f22bac988f2dd073601d75ba39ea5636ab6e38cb",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        commit = "8649f694d3e76ee10c19255dece6411c29206a54",
      },
      {
        "MunifTanjim/nui.nvim",
        commit = "53e907ffe5eedebdca1cd503b00aa8692068ca46",
      },
    },
    keys = {
      { "<leader>n", "<cmd>Navbuddy<cr>", desc = "Navigator", silent = true },
    },
    config = function()
      require("nvim-navbuddy").setup {
        window = { border = "rounded" },
        lsp = { auto_attach = true },
        icons = require("utils").nav_icons,
      }
      vim.api.nvim_set_hl(0, "NavbuddyName", { fg = "#DCD7BA", bold = true })
    end,
  },
  {
    "j-hui/fidget.nvim",
    commit = "d9ba6b7bfe29b3119a610892af67602641da778e",
    event = "LspAttach",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>lc", mode = { "n" }, function() require("fidget").notification.reset() end, desc = "Clear fidget notification" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    commit = "036885e8e5456d3907626b634693234f628afef6",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Add additional capabilities supported by nvim-cmp and ufo.nvim
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Define keymaps
      local function lsp_keymaps(bufnr)
        local opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references({includeDeclaration=false})<CR>", opts)
        keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        keymap(bufnr, "n", "g.", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
        keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
        keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>", opts)
        keymap(bufnr, "n", "<leader>lp", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>", opts)
        keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
        keymap(bufnr, "n", "<leader>lt", "<cmd>LspRestart<cr>", opts)
      end
      local on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
      end

      -- setup lsp servers
      local lspconfig = require "lspconfig"
      for _, server in pairs(require("lspsettings").servers) do
        Opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, "lspsettings." .. server)
        if require_ok then
          Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
        end

        lspconfig[server].setup(Opts)
      end

      local config = {
        -- disable virtual text
        virtual_text = false,
        -- config diagnostic signs
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
          suffix = "",
        },
      }

      vim.diagnostic.config(config)
    end,
  },
}
