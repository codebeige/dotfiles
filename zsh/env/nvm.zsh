if [[ -z $NVM_DIR ]]; then
  export NVM_DIR=$HOME/.nvm
  export NODE_VERSIONS=$NVM_DIR/versions/node
  export NODE_VERSION_PREFIX=v
fi

[[ -f $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh --no-use
