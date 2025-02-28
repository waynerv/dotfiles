local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup("plugins", {
  install = { colorscheme = { require("plugins.colorscheme").name } },
  defaults = { lazy = true, version = "11.17.1" },
  ui = { wrap = "true" },
  change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", -- Plugin for editing compressed files.
        -- "matchit", -- What is it?
        -- "matchparen", -- Plugin for showing matching parens
        "netrwPlugin", -- Handles file transfers and remote directory listing across a network
        "tarPlugin", -- Plugin for browsing tar files
        "tohtml", -- Converting a syntax highlighted file to HTML
        "tutor", -- Teaching?
        "zipPlugin", -- Handles browsing zipfiles
      },
    },
  },
  rocks = { enabled = false },
})
