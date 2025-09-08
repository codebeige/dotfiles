#!/usr/bin/env bb

(ns dotfiles.cli
  (:require [babashka.cli :as cli]
            [clojure.string :as str]
            [dotfiles.sym-links :as sym-links]))

(def spec
  {:spec
   {:force {:alias :f
            :coerce :boolean
            :desc "Overwrite existing files."}
    :help {:alias :h
           :coerce :boolean
           :desc "Show command line usage."}}
   :order [:force :help :zsh]
   :restrict true
   :error-fn
   (fn [{:keys [cause msg option type]}]
     (when (= :org.babashka/cli type)
       (case cause
         :coerce
         (println (format "Invalid value for: %s\n%s" (name option) msg))
         :restrict
         (do
          (println (format "Unknown option: %s\n" (name option)))
          (println (cli/format-opts spec))))
       (System/exit 1)))})

(def help-text
  (str/join
   ["Install dotfiles in your home directory.\n"
    "\n"
    "Creates symbolic links to relevant configuration files and ensures all\n"
    "required dependencies are installed.\n" ]))

(defn -main [& args]
  (let [{:keys [force help]} (cli/parse-opts args spec)]
    (if help
      (do
       (println help-text)
       (println (cli/format-opts spec)))
      (sym-links/create! force))))
