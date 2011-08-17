export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='/usr/local/bin/vim'
export NODE_PATH=/usr/local/lib/node_modules

alias redcar=wrapped_redcar

alias bx='bundle exec'
alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias spork='bundle exec spork'

alias gitrm='git rm $(git ls-files --deleted)'

# open a new tab on Terminal with the current working dir
function tab {
	osascript -e "
		tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
		delay 0.5
		tell application \"Terminal\" to do script \"cd \\\"$(PWD)\\\"\" in selected tab of the front window
	" > /dev/null 2>&1
}

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

# load rvm
[[ -s "/Users/tc/.rvm/scripts/rvm" ]] && source "/Users/tc/.rvm/scripts/rvm"
