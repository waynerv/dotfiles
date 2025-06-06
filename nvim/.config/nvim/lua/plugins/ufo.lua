local M = {
  "kevinhwang91/nvim-ufo",
  commit = "3c7a3570e9c9dc198a2ad4491b0b0e51c4d4ba08",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "kevinhwang91/promise-async",
      commit = "119e8961014c9bfaf1487bf3c2a393d254f337e2",
    },
    {
      "luukvbaal/statuscol.nvim",
      commit = "c46172d0911aa5d49ba5f39f4351d1bb7aa289cc",
      config = function()
        local builtin = require "statuscol.builtin"
        require("statuscol").setup {
          relculright = true,
          segments = {
            { sign = { name = { ".*" }, namespace = { "gitsigns", "diagnostic" }, colwidth = 1 }, click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          },
          ft_ignore = require("utils").ignore_filetypes,
          bt_ignore = require("utils").ignore_buftypes,
        }
      end,
    },
  },
  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    { "zm", function() require("ufo").closeFoldsWith() end, desc = "Fold more" },
    { "zk", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek folded" },
  },
  init = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end

    -- lsp->treesitter->indent
    local ftMap = {
      vim = "indent",
      python = { "indent" },
      git = "",
    }
    local function customizeSelector(bufnr)
      local function handleFallbackException(err, providerName)
        if type(err) == "string" and err:match "UfoFallbackException" then
          return require("ufo").getFolds(bufnr, providerName)
        else
          return require("promise").reject(err)
        end
      end

      return require("ufo")
        .getFolds(bufnr, "lsp")
        :catch(function(err)
          return handleFallbackException(err, "treesitter")
        end)
        :catch(function(err)
          return handleFallbackException(err, "indent")
        end)
    end

    require("ufo").setup {
      preview = {
        mappings = {
          scrollB = "<C-b>",
          scrollF = "<C-f>",
          scrollU = "<C-u>",
          scrollD = "<C-d>",
        },
      },
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return ftMap[filetype] or customizeSelector
      end,
    }
  end,
}

return M
