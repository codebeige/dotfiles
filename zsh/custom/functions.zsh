_set_up_custom_functions_dir() {
  local fdir=~/.zsh/functions
  local fns=($fdir/*(.N:t))
  if [[ ! -z $fns ]]; then
    fpath=($fdir $fpath)
    autoload -U $fns
  fi
}
_set_up_custom_functions_dir
unfunction _set_up_custom_functions_dir
