#!/bin/sh
if command -v hub >/dev/null 2>&1
    alias git='hub'
end

alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch -v'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gpr='gp && git pr'
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'

if command -v svu >/dev/null 2>&1
    alias gtpatch='echo `svu p`; git tag `svu p`'
    alias gtminor='echo `svu m`; git tag `svu m`'
end

function gi --description 'Adds a Gitignore for language'
    curl -s "https://www.gitignore.io/api/$argv"
end
