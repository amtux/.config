alias grep="grep --color"
alias cp="cp -i" # Confirm before overwriting something
alias df="df -h" # Human-readable sizes
alias free="free -m" # Show sizes in MB
alias g="gcloud"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias ls="eza -lha"
alias l="ls"
alias v="NVIM_APPNAME=kickstart nvim"
alias tm="tmux attach -t $1 || tmux new -t $1"
# alias docky="export DOCKER_HOST=unix:///$HOME/.colima/default/docker.sock && colima "
# alias docky-start="docky start --cpu 4 --memory 8 --disk 250"
alias z="zoxide"
alias yt-playlist="yt-dlp -f140 -x --embed-thumbnail --add-metadata"
alias yt-audio="yt-dlp -f140 --extract-audio --audio-quality=5 --add-metadata --embed-thumbnail"
alias yt-hq-audio="yt-dlp --extract-audio --audio-quality=0 -f ba --add-metadata --embed-thumbnail"
alias cr="curlie"

set -U fish_greeting
