alias rb="ruby"
alias ls='ls -GF'
alias g='git'
alias sed='gsed'

alias commit-log='git shortlog --summary -n'
alias blame='git log -p -S'
alias gls='git ls-files .'
alias smplsed='find . -type f -print0 | xargs -0 sed -i -e'

# Don't forget to use `bundle install --binstubs`
alias be='bundle exec'

# Inspired by Monokuma
alias up='cd ../'
alias upp='cd ../../'
alias uppp='cd ../../../'
alias upppp='cd ../../../../'

alias tmux-copy='tmux save-buffer - | reattach-to-user-namespace pbcopy'
alias tree='tree -N'
