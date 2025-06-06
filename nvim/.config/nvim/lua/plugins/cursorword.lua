local M = {
  "echasnovski/mini.cursorword",
  commit = "ab63cc74975f4e107dbb490f6d3040eacfc1c023",
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
