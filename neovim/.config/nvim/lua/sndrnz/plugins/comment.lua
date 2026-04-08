return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- TODO: Remove when fixed
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/126
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })

    require("Comment").setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
