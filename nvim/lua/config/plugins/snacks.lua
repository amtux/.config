require("snacks").setup({
  lazygit = {
    configure = true,
  },
  picker = {},
  explorer = {
    hidden = true,
  },
  terminal = {},
  scroll = { enabled = true },
})

local map = vim.keymap.set

-- Lazygit
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gG", function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end, { desc = "Lazygit (root dir)" })

-- Explorer
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "Explorer (cwd)" })
map("n", "<leader>E", function() Snacks.explorer({ cwd = vim.fn.getcwd() }) end, { desc = "Explorer (root dir)" })

-- Terminal
map({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Toggle terminal" })

-- Picker - Files
map("n", "<leader>ff", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, { desc = "Find files (cwd)" })
map("n", "<leader>fh", function() Snacks.picker.files({ cwd = vim.fn.getcwd(), hidden = true, ignored = true }) end, { desc = "Find files (hidden)" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fr", function() Snacks.picker.recent({ filter = { cwd = true } }) end, { desc = "Recent files (cwd)" })

-- Picker - Search
map("n", "<leader>sg", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, { desc = "Grep (cwd)" })
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep open buffers" })
map("n", "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Grep word under cursor" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP symbols" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo tree" })
map("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help" })
map("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command history" })
map("n", "<leader>:", function() Snacks.picker.commands() end, { desc = "Commands" })
