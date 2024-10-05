export EDITOR="nvim"
export VISUAL=$EDITOR
export K9S_CONFIG_DIR="$HOME/.config/k9s"

# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/homebrew/bin" #homebrew
export PATH="$PATH:$HOME/.krew/bin" #k9s

export npm_config_prefix="$HOME/.local" #npm

## setup go
export PATH="$PATH:/usr/local/go/bin" #go executables
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin" #go

export PATH="$PATH:$HOME/.cargo/bin" #rust
