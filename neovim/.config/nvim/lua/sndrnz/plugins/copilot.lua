return {
  "github/copilot.vim",
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      fg = mocha.overlay0,
      ctermfg = 244,
      force = true,
    })
  end,
}
