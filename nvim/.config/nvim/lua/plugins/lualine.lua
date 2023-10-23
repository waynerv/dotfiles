local M = {
  "nvim-lualine/lualine.nvim",
  commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    always_visible = true,
  }

  local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
  }

  local filetype = {
    "filetype",
    icons_enabled = true,
  }

  local location = {
    "location",
    padding = { left = 0, right = 1 },
  }

  local filename = {
    "filename",
    file_status = false,
    path = 1,
  }

  local spaces = function()
    return "spaces: " .. vim.bo.shiftwidth
  end
  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", diff },
      lualine_c = { filename },
      lualine_x = { diagnostics, spaces, "encoding", filetype },
      lualine_y = { location },
      lualine_z = { "progress" },
    },
    extensions = { "toggleterm", "quickfix", "nvim-tree" },
  }
end

return M
