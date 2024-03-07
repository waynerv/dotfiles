return {
  {
    "SmiteshP/nvim-navbuddy",
    commit = "46670b27a21ae26d25d3ee2b71f31729162f9de7",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        commit = "8649f694d3e76ee10c19255dece6411c29206a54",
      },
      {
        "MunifTanjim/nui.nvim",
        commit = "756c59f46057cd2d43619cd3a6d4e01b2aa60295",
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
    commit = "60404ba67044c6ab01894dd5bf77bd64ea5e09aa",
    event = "LspAttach",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>lc", mode = { "n" }, function() require("fidget").notification.reset() end, desc = "Clear fidget notification" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
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
        keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
        keymap(bufnr, "n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
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

      -- config diagnostic
      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
          active = signs,
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

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
    end,
  },
}
