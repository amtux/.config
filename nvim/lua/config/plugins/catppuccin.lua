require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    gitsigns = { enabled = true, transparent = true },
    treesitter = true,
    which_key = true,
    snacks = { enabled = true },
  },
})

vim.cmd.colorscheme("catppuccin")
