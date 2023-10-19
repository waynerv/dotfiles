local M = {
  "echasnovski/mini.cursorword",
  commit = "ff757d3d6d73e0c899083f6b4903f32980c5996b",
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
