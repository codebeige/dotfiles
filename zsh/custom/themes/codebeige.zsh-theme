ZSH_THEME_GIT_PROMPT_PREFIX=" %{%f%k%b%F{cyan}%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%F{cyan}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%B%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
 %{%F{blue}%}%#%{%f%k%b%} '

MODE_INDICATOR="%{%F{blue}%}<<<%{%f%k%b%}"
RPROMPT='$(vi_mode_prompt_info)'
