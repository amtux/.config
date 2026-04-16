-- Treesitter parses a file's syntax into a tree. It only looks at the current file
-- and knows nothing about the project. Provides: highlighting, indentation, folding.
-- It understands syntax ("this is a function", "this is a string").

local langs = {
  "lua",
  "vimdoc",
  "go",
  "cue",
  "rust",
  "javascript",
  "typescript",
  "python",
  "bash",
  "yaml",
  "json",
  "markdown",
  "helm",
}

-- install parsers if missing (async, no-op if already installed)
require("nvim-treesitter").install(langs)

-- syntax highlighting using treesitter's parser (better than regex-based)
-- auto-indent using syntax tree (smarter than smartindent)
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.treesitter.get_parser(0, nil, { error = false }) then
      vim.treesitter.start()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- treesitter-based code folding (fold functions, if blocks, etc.)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false -- start with all folds open, toggle with za/zM/zR
