return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "cssls",
      "emmet_language_server",
      "html",
      "jsonls",
      "lua_ls",
      "tailwindcss",
      "ts_ls",
      "pyright",
      "phpactor",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "prettier",
          "stylua",
          "eslint_d",
          "ruff",
        },
      },
    },
  },
}
