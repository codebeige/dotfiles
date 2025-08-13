(local name :basedpyright)

(local root-markers
  ["pyproject.toml"
   "setup.py"
   "setup.cfg"
   "requirements.txt"
   "Pipfile"
   "pyrightconfig.json"
   ".git"])

(fn set-path [buffer path]
  (let [settings {:python {:pythonPath path}}]
    (each [_ client (ipairs (vim.lsp.get_clients {: name :bufnr buffer}))]
      (case client
        {:settings s}
        (vim.tbl_deep_extend :force s settings)
        c
        (vim.tbl_deep_extend :force c {:config {: settings}}))
      (client.notify :workspace/didChangeConfiguration {:settings nil}))))

(fn on-attach [client buffer]
  (vim.api.nvim_buf_create_user_command
    buffer
    :LspPyrightOrganizeImports
    #(client:exec_cmd {:command :basedpyright.organizeimports
                       :arguments [(vim.uri_from_bufnr buffer)]})
    {})
  (vim.api.nvim_buf_create_user_command
    buffer
    :LspPyrightSetPythonPath
    (partial set-path buffer)
    {:desc "Reconfigure basedpyright with the provided python path"
     :nargs 1
     :complete "file"})
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 "gro" 2 "<Cmd>LspPyrightOrganizeImports<CR>" : buffer :desc "Organize imports"}
       {1 "grp" 2 "<Cmd>LspPyrightSetPythonPath " : buffer :desc "Configure python path"}])))

(local config
  {:cmd ["basedpyright-langserver" "--stdio"]
   :filetypes [:python]
   :root_markers root-markers
   :settings {:basedpyright
              {:analysis
               {:autoSearchPaths true
                :diagnosticMode "openFilesOnly"
                :typeCheckingMode "basic"
                :useLibraryCodeForTypes true}}}
   :on_attach on-attach})

{: name
 : config}
