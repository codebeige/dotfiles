(local name :sourcekit)

(fn xcode? [f]
  (let [ext (vim.fs.ext f)]
    (or (= ext :xcodeproj)
        (= ext :xcworkspace))))

(fn root-dir [b]
  (vim.fs.root
    b
    [[:buildServer.json :.bsp]
     xcode?
     ["compile_commands.json" "Package.swift"]
     ".git"]))

(fn lang-id [ft]
  (case ft
    :objc "objective-c"
    :objcpp "objective-cpp"
    _ ft))

(local capabilities
  {:workspace
   {:didChangeWatchedFiles {:dynamicRegistration true}
    :textDocument {:diagnostic {:dynamicRegistration true
                                :relatedDocumentSupport true}}}})

(local config
  {:cmd ["sourcekit-lsp"]
   :filetypes [:swift]
   :root_dir (fn [buf on-dir] (-?> buf root-dir on-dir))
   :get_language_id #(lang-id $2)
   : capabilities})

{: name
 : config}
