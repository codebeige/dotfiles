if [[ -f ${LUAROCKS_CONFIG:=$HOME/.luarocks/config.lua} ]]; then
  export LUAROCKS_CONFIG
fi

if [[ -x ${LUAROCKS:=$(which luarocks)} ]]; then
  [[ -x ${LUAJIT:=$(which luajit)} ]] && alias luarocks="$LUAJIT $LUAROCKS"
  eval $(luarocks path)
fi
