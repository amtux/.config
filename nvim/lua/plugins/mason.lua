return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = "Mason",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters
        "prettier",
        "stylua",
        "gofumpt",
        "shfmt",
        -- Linters
        "golangci-lint",
        -- LSP servers
        "lua-language-server",
        "gopls",
        "cuelsp",
        "yaml-language-server",
        "bash-language-server",
        "helm-ls",
      },
    })
  end,
}
