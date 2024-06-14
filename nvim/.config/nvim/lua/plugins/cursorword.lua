local M = {
  "echasnovski/mini.cursorword",
  commit = "b6fb7e8556b3e3bb09c5cca1937d8e542f8a0261",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*",
    callback = function(event)
      local ft_allowlist = require("utils").enhance_filetypes
      local buf = event.buf
      if not vim.tbl_contains(ft_allowlist, vim.bo[buf].filetype) then
        vim.b.minicursorword_disable = true
      end
    end,
  })

  require("mini.cursorword").setup {
    delay = 300,
  }

  vim.api.nvim_set_hl(0, "MiniCursorword", { link = "LspReferenceText" })
end

return M
