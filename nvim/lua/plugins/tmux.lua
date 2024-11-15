return {
  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({
        disable_on_zoom = true,
        mux = "auto",
      })
    end,
    keys = {
      {
        "<C-h>",
        "<cmd>lua require('Navigator').left()<cr>",
        desc = "Navigate left",
      },
      {
        "<C-j>",
        "<cmd>lua require('Navigator').down()<cr>",
        desc = "Navigate down",
      },
      {
        "<C-k>",
        "<cmd>lua require('Navigator').up()<cr>",
        desc = "Navigate up",
      },
      {
        "<C-l>",
        "<cmd>lua require('Navigator').right()<cr>",
        desc = "Navigate right",
      },
    },
  },
}
