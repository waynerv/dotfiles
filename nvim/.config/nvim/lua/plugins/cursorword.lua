local M = {
  "echasnovski/mini.cursorword",
  commit = "8d3e1e052688bcd52e9e819a5cdb7f8a5b498c64",
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
