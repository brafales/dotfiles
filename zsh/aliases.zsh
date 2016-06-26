#Ruby
alias be='bundle exec'
alias bi='bundle install -j4'
alias single_test='noglob bundle exec ruby -I"lib:test"'

#Git
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gi='git checkout integration'
alias gitx='open -a GitX .'
alias gm='git checkout master'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git pull --rebase'
alias gs='git status'
alias gst='git status'

#Misc
alias ll='ls -alh'
alias regenerate_ctags='ctags -R -f .tags --exclude=vendor --exclude=.bundle --exclude=node_modules --exclude=log --exclude=tmp'
