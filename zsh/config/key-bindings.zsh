bindkey -M viins '^ä' vi-cmd-mode
bindkey -M viins '^_' insert-last-word

bindkey -M vicmd k vi-up-line-or-history
bindkey -M vicmd j vi-down-line-or-history

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey ' ' magic-space
bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

