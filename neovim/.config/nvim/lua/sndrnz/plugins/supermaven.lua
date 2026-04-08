return {
  "supermaven-inc/supermaven-nvim",
  enabled = false,
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    require("supermaven-nvim").setup({
      color = {
        suggestion_color = mocha.overlay0,
        cterm = 244,
      },
    })
  end,
}
