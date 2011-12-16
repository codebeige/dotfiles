export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='/usr/local/bin/vim'
export PSQL_EDITOR='vim -c"set syntax=sql"'
export NODE_PATH=/usr/local/lib/node_modules

alias redcar=wrapped_redcar

# alias bx='bundle exec'
# alias rails='bundle exec rails'
# alias rake='bundle exec rake'
# alias spork='bundle exec spork'
# alias cap='bundle exec cap'

alias gitrm='git rm $(git ls-files --deleted)'

# git prompt
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  
  . /usr/local/etc/bash_completion.d/git-completion.bash
  
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWSTASHSTATE=1
  
  function __git_color() {
    local git_ps1=$(__git_ps1)
    if [[ "$git_ps1" =~ %|\* ]]; then
      echo 31
    elif [[ "$git_ps1" =~ \+ ]]; then
      echo 33
    else
      echo 32
    fi
  }
  
  export PS1='\[\e[0;34m\]\u@\h:\[\e[1;34m\] \W\[\e[0;$(__git_color)m\]$(__git_ps1 "[%s]")\[\e[0;35m\] \$\[\e[0m\] '
else
  export PS1='\[\e[0;34m\]\u@\h:\[\e[1;34m\] \W \[\e[0m\]\$ '
fi

# rbenv
eval "$(rbenv init -)"

# bundle-exec
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh
