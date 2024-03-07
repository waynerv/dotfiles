local M = {
  "rebelot/kanagawa.nvim",
  commit = "bfa818c7bf6259152f1d89cf9fbfba3554c93695",
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
