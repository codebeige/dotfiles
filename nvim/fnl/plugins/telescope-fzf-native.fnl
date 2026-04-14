(fn build [{: path}]
  (vim.system [:make] {:cwd path}))

{: build}
