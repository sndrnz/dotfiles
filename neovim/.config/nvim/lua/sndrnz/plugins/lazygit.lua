return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
  config = function()
    vim.g.lazygit_use_custom_config_file_path = 1
    local config_dir = vim.fn.expand("$HOME/.config/lazygit/config.yml")
    vim.g.lazygit_config_file_path = config_dir
  end,
}
