_asdf_prefix=$(brew --prefix asdf)
ASDF_DIR="$_asdf_prefix/libexec"
ASDF_COMPLETIONS="$_asdf_prefix/share/zsh/site-functions"
unset _asdf_prefix

# Load command
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
  source "$ASDF_DIR/asdf.sh"
  # Load completions
  if [[ -f "$ASDF_COMPLETIONS/_asdf" ]]; then
    fpath+=("$ASDF_COMPLETIONS")
    autoload -Uz _asdf
    compdef _asdf asdf # compdef is already loaded before loading plugins
  fi
fi
