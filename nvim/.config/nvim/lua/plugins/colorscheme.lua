local M = {
  "rebelot/kanagawa.nvim",
  commit = "08ed29989834f5f2606cb1ef9d5b24c5ea7b8fa5",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "kanagawa"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
