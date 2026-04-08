return {
  "goolord/alpha-nvim",
  enabled = false,
  event = "VimEnter",
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    require("alpha").setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
