require("conform").setup({
  formatters_by_ft = {
    html = { "prettier" },
    lua = { "stylua" },
    fish = { "fish_indent" },
    sh = { "shfmt" },
    go = { "gofumpt" },
    cue = { "cuefmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  formatters = {
    cuefmt = {
      command = "cue",
      args = { "fmt", "-" },
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.keymap.set("", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })
