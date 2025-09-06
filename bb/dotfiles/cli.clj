(ns dotfiles.cli
  (:require [babashka.cli :as cli]
            [dotfiles.sym-links :as sym-links]))

(def spec
  {:spec
   {:force {:coerce :boolean
            :desc "Overwrite existing files"
            :alias :f}}})

(defn -main [& args]
  (let [opts (cli/parse-opts args spec)]
    (sym-links/create! opts)))
