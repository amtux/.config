return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    lazygit = {
      configure = true,
    },
    picker = {},
    explorer = {},
    terminal = {},
  },
  keys = {
    -- Lazygit
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit (cwd)" },
    { "<leader>gG", function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit (Root Dir)" },

    -- Explorer
    { "<leader>fe", function() Snacks.explorer() end, desc = "Explorer (cwd)" },
    { "<leader>fE", function() Snacks.explorer({ cwd = vim.fn.getcwd() }) end, desc = "Explorer (root dir)" },
    { "<leader>e", "<leader>fe", desc = "Explorer (cwd)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer (root dir)", remap = true },

    -- Terminal
    { "<C-/>", function() Snacks.terminal() end, desc = "Toggle terminal", mode = { "n", "t" } },

    -- Picker - Files
    { "<leader>fF", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>ff", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, desc = "Find files (cwd)" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find files (git-files)" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fR", function() Snacks.picker.recent() end, desc = "Recent files" },
    { "<leader>fr", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Recent files (cwd)" },

    -- Picker - Search
    { "<leader>sG", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sg", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, desc = "Grep (cwd)" },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep open buffers" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo tree" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command history" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>:", function() Snacks.picker.commands() end, desc = "Commands" },
  },
}
