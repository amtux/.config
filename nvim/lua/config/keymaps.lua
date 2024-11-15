-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- change nvim-cmp keys
local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<Right>"] = cmp.mapping.confirm({ select = true }), -- Change "<CR>" to your desired key
  },
})
