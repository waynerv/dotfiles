local M = {
  "nvim-mini/mini.cursorword",
  commit = "d843392f739fcfd85969e2dadeb71c8e0221afb5",
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
