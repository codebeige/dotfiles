let g:projectionist_heuristics = {
    \ "package.json"  :
    \   { "README.md" : { "type": "readme" }
    \   , "lib/*.js"  : { "type": "lib", "alternate": "test/{}.js" }
    \   , "test/*.js" : { "type": "test", "alternate": "lib/{}.js" }
    \   , "bin/*.js"  : { "type": "bin" }
    \   }
    \ }
