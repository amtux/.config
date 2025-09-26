return {
  {
    "folke/snacks.nvim",
    keys = {
      -- swap recent files and recent files(cwd) since the latter is used more often
      { "<leader>fR", LazyVim.pick("oldfiles"), desc = "Recent" },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent({ filter = { cwd = true } })
        end,
        desc = "Recent (cwd)",
      },
    },
  },
}
