local opt = vim.opt

-- File
opt.backup = false                          -- creates a backup file
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.swapfile = false                        -- creates a swapfile
opt.undofile = true                         -- enable persistent undo
opt.fileencoding = "utf-8"                  -- the encoding written to a file

-- Edit
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.updatetime = 300                        -- save swap file and trigger CursorHold (4000ms default)
opt.timeout = true
opt.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.confirm = true                          -- Confirm to save changes before exiting modified buffer

-- Search
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.smartcase = true                        -- smart case

-- Tab & Indent & Wrap
opt.expandtab = true                        -- convert tabs to spaces when insert
opt.softtabstop = 4                         -- how far cursor moves while typing Tab
opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
opt.tabstop = 4                             -- define tab display width as 4 spaces
opt.smartindent = true                      -- make indenting smarter again
opt.wrap = false                            -- display lines as one long line
opt.linebreak = true                        -- wrap lines at 'breakat'
opt.breakindent = true                      -- wrap indent to match line start

-- UI
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.cursorline = true                       -- highlight the current line
opt.number = true                           -- set numbered lines
opt.relativenumber = true                   -- show relativenumber line
opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
opt.ruler = false                           -- hide the line and column number of the cursor position
opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
opt.pumheight = 10                          -- pop up menu height
opt.laststatus = 0                          -- nerver show status line, but always overridden by statusline plugin config
opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0                         -- always show tabs
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.winborder = 'rounded'                   -- use rounded borders on all floating windows

-- Settings
opt.fillchars.eob = " "                     -- show empty lines at the end of a buffer as ` ` {default `~`}
opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
opt.whichwrap:append "<,>,[,],h,l"          -- keys allowed to move to the previous/next line when the beginning/end of line is reached
opt.iskeyword:append "-"                    -- treats words with `-` as single words
