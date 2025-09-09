return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["html"] = { "prettier" },
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        go = { "gofumpt" },
        cue = { "cuefmt" },
      },
      formatters = {
        ["cuefmt"] = {
          command = "cue",
          args = { "fmt", "-" },
        },
      },
    },
  },
}
