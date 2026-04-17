-- Appearance
vim.opt.number = true           -- show line numbers
vim.opt.relativenumber = true   -- relative to cursor, makes motions like 5j easy
vim.opt.cursorline = true       -- highlight current line
vim.opt.termguicolors = true    -- 24-bit color, required for catppuccin
vim.opt.signcolumn = "yes"      -- always show gutter (git signs, diagnostics), prevents layout shift
vim.opt.showmode = false        -- hide -- INSERT -- , lualine shows it
vim.opt.wrap = false            -- long lines go off-screen
vim.opt.scrolloff = 8           -- keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8       -- keep 8 columns visible to the side

-- Indentation
vim.opt.tabstop = 2             -- tab renders as 2 spaces
vim.opt.shiftwidth = 2          -- >> and << indent by 2
vim.opt.expandtab = true        -- tab key inserts spaces
vim.opt.smartindent = true      -- auto-indent based on syntax (e.g. after {)
vim.opt.autoindent = true       -- new line copies indentation from above

-- Search
vim.opt.ignorecase = true       -- /foo matches Foo, FOO
vim.opt.smartcase = true        -- ...unless you type a capital: /Foo only matches Foo
vim.opt.hlsearch = true         -- highlight all matches
vim.opt.incsearch = true        -- jump to matches as you type

-- Editing
vim.opt.undofile = true         -- persist undo history across sessions
vim.opt.undolevels = 10000      -- 10k undo steps (default 1000)
vim.opt.swapfile = false        -- no .swp files
vim.opt.backup = false          -- no ~ backup files
vim.opt.clipboard = "unnamedplus" -- yank/paste uses system clipboard
-- completeopt controls the completion popup behavior:
--   menu     — show popup menu when there are multiple matches
--   menuone  — show popup even when there's only one match
--   noinsert — preselect first item but don't insert until confirmed (C-y accepts)
--   noselect — don't preselect any item (must C-n first, then C-y to accept)
vim.opt.completeopt = "menu,menuone,noinsert"

-- Splits
vim.opt.splitright = true       -- vsplit opens to the right
vim.opt.splitbelow = true       -- split opens below

-- Performance
vim.opt.updatetime = 250        -- CursorHold after 250ms, makes gitsigns/diagnostics faster
vim.opt.timeoutlen = 300        -- wait 300ms for key sequence, controls which-key popup delay

-- Misc
vim.opt.mouse = "a"             -- mouse works in all modes
vim.opt.confirm = true          -- ask to save instead of failing on quit
vim.opt.list = true             -- show invisible characters
vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" } -- render tabs, trailing spaces, nbsp

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  -- show full diagnostics on their own lines below the code, only for current cursor line
  virtual_lines = { current_line = true },
  signs = true,                 -- show error/warning icons in sign column
  underline = true,             -- underline problematic code
  update_in_insert = false,     -- don't update while typing, wait until leaving insert
  severity_sort = true,         -- errors shown before warnings
})
