require("which-key").setup({
  icons = {
    mappings = true,
  },
  spec = {
    { "<leader>b", group = "buffer" },
    { "<leader>c", group = "code" },
    { "<leader>d", group = "diagnostic" },
    { "<leader>f", group = "file/find" },
    { "<leader>g", group = "git" },
    { "<leader>h", group = "git hunk" },
    { "<leader>q", group = "quit" },
    { "<leader>s", group = "search" },
    { "<leader>t", group = "toggle" },
    { "<leader>w", group = "workspace" },
  },
})
