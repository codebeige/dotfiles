(ns dotfiles.sym-links
  (:require [babashka.fs :as fs]))

(def symlinks
  {"Brewfile"               ".Brewfile"
   "asdfrc"                 ".asdfrc"
   "clojure/deps.edn"       ".clojure/deps.edn"
   "config/clj-kondo"       ".config/clj-kondo"
   "config/clojure-lsp"     ".config/clojure-lsp"
   "config/direnv"          ".config/direnv"
   "config/gh"              ".config/gh"
   "config/kitty"           ".config/kitty"
   "config/pgcli"           ".config/pgcli"
   "config/tmux/tmux.conf"  ".config/tmux/tmux.conf"
   "ctags"                  ".ctags"
   "gitconfig"              ".gitconfig"
   "gitignore"              ".gitignore"
   "inputrc"                ".inputrc"
   "lesskey"                ".lesskey"
   "luarocks/config.lua"    ".luarocks/config.lua"
   "nvim"                   ".config/nvim"
   "profile"                ".profile"
   "shadow-cljs/config.edn" ".shadow-cljs/config.edn"
   "ssh/config"             ".ssh/config"
   "tigrc"                  ".tigrc"
   "tool-versions"          ".tool-versions"
   "zsh"                    ".zsh"
   "zshenv"                 ".zshenv"
   "zshrc"                  ".zshrc"})

(defn create! [force?]
  (doseq [[target link] symlinks]
    (let [f (fs/path (fs/home) link)
          exists? (fs/exists? f)]
      (if (or force? (not exists?))
        (do
         (when exists? (fs/delete f))
         (fs/create-dirs (fs/parent f))
         (fs/create-sym-link f (fs/absolutize target)))
        (println (format "Skipped %s, because it already exists. (Use --force to override)" f))))))
