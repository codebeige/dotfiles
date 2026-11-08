(local name :html-lsp)

(local config
  {:cmd ["vscode-html-language-server" "--stdio"]
   :filetypes [:html]
   :root_markers ["package.json" ".git"]
   :init_options {:provideFormatter true
                  :embeddedLanguages {:css true :javascript true}}})

{: name
 : config}
