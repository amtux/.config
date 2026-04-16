# Neovim Config

Minimal config for Neovim 0.12+ using native `pack/` for plugin management.

## Plugin Management

- Plugins are git-cloned into `~/.local/share/nvim/site/pack/plugins/start/`
- `:PackUpdate` — pull latest for all unpinned plugins
- `:PackClean` — remove plugins not in the list
- Pin a plugin to a tag/commit by adding `pin = "v1.0.0"` in `init.lua`

## Completion

Uses Neovim's native LSP completion (no plugin).

- Auto-triggers on `.` (and other LSP trigger characters)
- `<C-n>` — open completion / next item
- `<C-p>` — previous item
- `<C-y>` — accept selection
- `<C-e>` — dismiss popup

Unlike blink.cmp or nvim-cmp, native completion does **not** trigger on every keystroke. Press `<C-n>` to trigger manually when typing a symbol name.

## Keymaps

Leader key: `<Space>`

### General
| Key | Action |
|---|---|
| `<C-s>` | Save file |
| `<Esc>` | Clear search highlights |
| `<leader>qq` | Quit all |
| `<leader>p` (visual) | Paste without yanking |

### Windows
| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move between windows |
| `<C-Up/Down/Left/Right>` | Resize windows |

### Buffers
| Key | Action |
|---|---|
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<leader>bd` or `<leader>x` | Delete buffer |

### Lines
| Key | Action |
|---|---|
| `<A-j>` / `<A-k>` | Move line(s) up/down |
| `<` / `>` (visual) | Indent and reselect |

### LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `K` | Hover documentation |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>cr` | Rename |
| `<leader>ca` | Code action |

### Diagnostics
| Key | Action |
|---|---|
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>e` | Show diagnostic float |
| `<leader>q` | Diagnostic quickfix list |

### Git (gitsigns)
| Key | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff this |
| `<leader>tb` | Toggle inline blame |
| `<leader>td` | Toggle show deleted lines |

### Git (other)
| Key | Action |
|---|---|
| `<leader>gg` | Lazygit (cwd) |
| `<leader>gG` | Lazygit (root dir) |
| `<leader>gy` | Open git link in browser |
| `<leader>gY` | Yank git link |

### Files / Search (snacks picker)
| Key | Action |
|---|---|
| `<leader>ff` | Find files (cwd) |
| `<leader>fh` | Find files (hidden) |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files (cwd) |
| `<leader>sg` | Grep (cwd) |
| `<leader>sb` | Buffer lines |
| `<leader>sB` | Grep open buffers |
| `<leader>sw` | Grep word under cursor |
| `<leader>ss` | LSP symbols |
| `<leader>sd` | Diagnostics |
| `<leader>sk` | Keymaps |
| `<leader>su` | Undo tree |
| `<leader>sR` | Resume last picker |
| `<leader>sh` | Help |
| `<leader>sc` | Command history |
| `<leader>:` | Commands |

### Explorer / Terminal
| Key | Action |
|---|---|
| `<leader>e` | File explorer (cwd) |
| `<leader>E` | File explorer (root dir) |
| `<C-/>` | Toggle terminal |

### Formatting
| Key | Action |
|---|---|
| `<leader>cf` | Format buffer |
| (auto) | Format on save |

### Folding
| Key | Action |
|---|---|
| `za` | Toggle fold under cursor |
| `zM` | Close all folds |
| `zR` | Open all folds |

## Plugins

1. catppuccin — theme (mocha, transparent)
2. nvim-treesitter — syntax highlighting, indentation, folding
3. nvim-lspconfig — LSP server configurations
4. conform.nvim — format on save
5. gitsigns.nvim — git gutter + hunk operations
6. snacks.nvim — picker, explorer, lazygit, terminal
7. lualine.nvim — statusline
8. bufferline.nvim — buffer tabs
9. which-key.nvim — keybinding help popup
10. gitlinker.nvim — GitHub file links
11. nvim-web-devicons — file icons

## External Dependencies

Run `install-deps.sh` to install all dependencies, or install manually:

**Treesitter**: `tree-sitter-cli`
**LSP servers**: `lua-language-server`, `gopls`, `cue`, `bash-language-server`, `yaml-language-server`, `helm-ls`
**Formatters**: `prettier`, `stylua`, `shfmt`, `gofumpt`
