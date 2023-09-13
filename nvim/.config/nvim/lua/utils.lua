local M = {}

M.ignore_buftypes = {
  "nofile",
  "terminal",
  "prompt",
}

M.ignore_filetypes = {
  "aerial",
  "alpha",
  "dashboard",
  "dirvish",
  "DressingInput",
  "DressingSelect",
  "fugitive",
  "help",
  "mason",
  "Navbuddy",
  "neogitstatus",
  "NvimTree",
  "lazy",
  "lir",
  "Outline",
  "packer",
  "qf",
  "spectre_panel",
  "toggleterm",
  "TelescopePrompt",
  "Trouble",
}

M.kind_icons = {
  Array = "󰅪",
  Boolean = "◩",
  Class = "󰌗",
  Codeium = "󰚩",
  Color = "󰏘",
  Constant = "󰇽",
  Constructor = "",
  Copilot = "",
  Enum = "󰕘",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "󰈙",
  Folder = "󰉋",
  Function = "󰊕",
  Interface = "",
  Key = "󰌋",
  Keyword = "󰌋",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "󰟢",
  Number = "󰎠",
  Object = "󰅩",
  Operator = "󰆕",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  Text = "󰉿",
  TypeParameter = "󰊄",
  Unit = "",
  Value = "󰎠",
  Variable = "",
}

local function append_whitespace(tbl)
  local new_tbl = {}

  for key, value in pairs(tbl) do
    new_tbl[key] = value .. " "
  end

  return new_tbl
end

M.nav_icons = append_whitespace(M.kind_icons)

return M
