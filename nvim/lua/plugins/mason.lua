return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "cueimports", -- cue formatter
        "cuelsp", -- cue LSP
        "gopls", -- go LSP
        "golangci-lint", -- go linter
        "gofumpt", -- go formatter
        "yaml-language-server", -- yaml LSP
        "bash-language-server", -- bash LSP
        "helm-ls",
      },
    },
  },
}
