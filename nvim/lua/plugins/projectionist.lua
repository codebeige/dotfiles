-- [nfnl] Compiled from fnl/plugins/projectionist.fnl by https://github.com/Olical/nfnl, do not edit.
local function config()
  vim.g.projectionist_heuristics = {["deps.edn|project.clj|build.boot"] = {["src/*.clj"] = {type = "source", alternate = "test/{}_test.clj"}, ["src/*.cljs"] = {type = "source", alternate = "test/{}_test.cljs"}, ["src/*.cljc"] = {type = "source", alternate = "test/{}_test.cljc"}}, ["shadow-cljs.edn"] = {["src/*.cljs"] = {type = "source", alternate = "test/{}_test.cljs"}, ["test/*_test.cljs"] = {type = "test", alternate = "src/{}.cljs"}}}
  return nil
end
return {"tpope/vim-projectionist", config = config}
