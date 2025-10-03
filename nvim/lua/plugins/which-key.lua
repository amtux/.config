return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = true,
    },
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "git hunk" },
      { "<leader>s", group = "search" },
      { "<leader>q", group = "quit" },
      { "<leader>w", group = "workspace" },
      { "<leader>d", group = "diagnostic" },
      { "<leader>r", group = "rename" },
    },
  },
}
