(fn build [{: path}]
  (dofile (vim.fs.joinpath path "build.lua")))

{: build}
