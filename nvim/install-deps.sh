#!/bin/bash
set -e

echo "=== Neovim external dependencies ==="

# Tree-sitter CLI (needed by nvim-treesitter to compile parsers)
echo "--- tree-sitter-cli ---"
brew install tree-sitter-cli

# LSP servers
echo "--- LSP servers ---"
brew install lua-language-server
brew install yaml-language-server
brew install bash-language-server
brew install helm-ls
go install golang.org/x/tools/gopls@latest
# cue lsp is built into the cue CLI
brew install cue

# Formatters (used by conform.nvim)
echo "--- Formatters ---"
npm install -g prettier
brew install stylua
brew install shfmt
go install mvdan.cc/gofumpt@latest
# fish_indent comes with fish shell, no install needed
# cue fmt is built into the cue CLI

echo "=== Done ==="
