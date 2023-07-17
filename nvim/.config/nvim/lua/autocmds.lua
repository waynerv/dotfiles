-- close some filetypes with <q>
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "checkhealth", "lspinfo", "spectre_panel" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- change indentation for some filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go", "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- stop automatic newline continuation of comments
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    local exclude = { "gitcommit", "gitrebase" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto enter nvim-tree explorer when open directory
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(event)
    local is_dir = vim.fn.isdirectory(event.file) == 1
    if not is_dir then
      return
    end
    vim.cmd.cd(event.file)
    require("nvim-tree.api").tree.open()
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link IlluminatedWordText LspReferenceText"
    vim.cmd "hi link IlluminatedWordRead LspReferenceText"
    vim.cmd "hi link IlluminatedWordWrite LspReferenceText"
  end,
})
