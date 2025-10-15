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
    commit = "3f5475949679953af6d78654db29b944fa826e6a",
    event = "LspAttach",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>lc", mode = { "n" }, function() require("fidget").notification.reset() end, desc = "Clear fidget notification" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    commit = "6bdb14f230de0904229ec367b410fb817e59b072",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "mason-org/mason.nvim",
        commit = "ad7146aa61dcaeb54fa900144d768f040090bff0",
        cmd = "Mason",
        opts = {
          ui = {
            border = "none",
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- config common capbilities
      vim.lsp.config("*", {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      })

      -- config diagnostic
      local diagnostics = {
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
      vim.diagnostic.config(diagnostics)

      -- config LSP keymaps
      -- stylua: ignore
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local keymap = function(keys, func, desc, mode, opts)
            mode = mode or "n"
            opts = vim.tbl_extend("force", { buffer = event.buf, noremap = true, silent = true, desc = desc }, opts or {})
            vim.keymap.set(mode, keys, func, opts)
          end
          keymap("gD", vim.lsp.buf.declaration, "Goto Declaration")
          keymap("gd", vim.lsp.buf.definition, "Goto Definition")
          keymap("gI", vim.lsp.buf.implementation, "Goto Implementation")
          keymap("gr", function() vim.lsp.buf.references { includeDeclaration = false } end, "References", nil, { nowait = true })
          keymap("gl", vim.diagnostic.open_float, "Show Diagnostic")
          keymap("g.", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
          keymap("<leader>li", "<cmd>LspInfo<cr>")
          keymap("<leader>lI", "<cmd>Mason<cr>")
          keymap("<leader>ln", function() vim.diagnostic.jump { count = 1, float = true } end, "Next Diagnostic")
          keymap("<leader>lp", function() vim.diagnostic.jump { count = -1, float = true } end, "Prev Diagnostic")
          keymap("<leader>lr", vim.lsp.buf.rename, "Rename")
          keymap("<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
          keymap("<leader>lq", vim.diagnostic.setloclist, "Diagnostic Loclist")
          keymap("<leader>lt", "<cmd>LspRestart<cr>")
        end,
      })

      -- Ensure packages are installed
      local ensure_installed = {
        "bash-language-server",
        "lua-language-server",
        "yaml-language-server",
        "basedpyright",
        "ruff",
        "gopls",
        -- tools
        "goimports-reviser",
        "shellcheck",
        "shfmt",
        "staticcheck",
        "stylua",
      }
      local mr = require "mason-registry"
      mr.refresh(function()
        for _, tool in ipairs(ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)

      -- Automatically install/enable language servers
      require("mason-lspconfig").setup {
        automatic_enable = {
          exclude = {
            "stylua",
          },
        },
      }
    end,
  },
}
