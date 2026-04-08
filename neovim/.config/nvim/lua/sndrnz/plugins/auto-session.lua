return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
    { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
  },
  opts = {
    auto_restore = true,
    auto_save = true,
    suppressed_dirs = { "~/" },
  },
}
