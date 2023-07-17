-- Shorten function name
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  -- Silent keymap option as default
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Remap space as leader key
-- make sure to set `mapleader` before lazy so your mappings are correct
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "x",
--   select_mode = "s",
--   visual_and_select_mode = "v",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move with shift-arrows
map("n", "<M-Up>", "<C-w><S-k>", { desc = "Move window up" })
map("n", "<M-Down>", "<C-w><S-j>", { desc = "Move window down" })
map("n", "<M-Left>", "<C-w><S-h>", { desc = "Move window to left" })
map("n", "<M-Right>", "<C-w><S-l>", { desc = "Move window to right" })

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Easier access to beginning and end of line
map({ "n", "v" }, "<M-h>", "^", { desc = "Go to beginning of line" })
map({ "n", "v" }, "<M-l>", "$", { desc = "Go to end of line" })

-- Clear search highlights with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better paste
map("v", "p", "P")

-- save file
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Insert --
-- Press jj fast to enter
map("i", "jj", "<esc>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Utils --
map("n", "<leader>i", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
