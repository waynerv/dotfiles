local M = {
  "windwp/nvim-autopairs",
  commit = "f6c71641f6f183427a651c0ce4ba3fb89404fa9e",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
}

function M.config()
  require("nvim-autopairs").setup {
    check_ts = true, -- treesitter integration
    disable_filetype = { "TelescopePrompt" },
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
      use_virt_lines = false,
    },
  }

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
end

return M
