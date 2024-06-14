-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/opt/homebrew" };
}
variables = {
   LUA_DIR = "/opt/homebrew/opt/luajit";
   LUA_BINDIR = "/opt/homebrew/opt/luajit/bin";
   LUA_VERSION = "5.1";
   LUA = "/opt/homebrew/opt/luajit/bin/luajit";
}
