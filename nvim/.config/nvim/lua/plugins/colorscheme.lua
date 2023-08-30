local M = {
  "rebelot/kanagawa.nvim",
  commit = "0a24e504a3a278849ad0aef31cd6dd24c73ca3db",
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
