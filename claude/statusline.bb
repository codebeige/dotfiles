#!/usr/bin/env bb

(ns statusline
  (:require [babashka.fs :as fs]
            [babashka.process :refer [shell]]
            [cheshire.core :as json]
            [clojure.string :as str]))

(def compact-limit
  "Local sessions are capped at 64K. Warn well before that."
  50000)

(def home
  "The home directory to resolve Claude Code's config against.

  Follows `$HOME` rather than `babashka.fs/home`, which only reports the
  `user.home` system property ignoring the actual shell environment."
  (or (System/getenv "HOME") (str (fs/home))))

(def local?
  (some->
   (System/getenv "ANTHROPIC_BASE_URL")
   (str/starts-with? "http://localhost")))

(defn json->clj [f]
  (json/parse-string (slurp f) true))

(defn read-json
  "Parse `f` as JSON, or nil when it is missing or malformed."
  [f]
  (try
    (json->clj (fs/file f))
    (catch Exception _ nil)))

(def config
  (read-json (fs/path home ".claude.json")))

(def config-theme-name
  (or (not-empty (:theme config)) "dark"))

(def themes-dir
  (fs/path home ".claude" "themes"))

(defn custom-theme []
  (read-json (fs/path themes-dir (str config-theme-name ".json"))))

(defn theme-name [custom]
  (or (not-empty (:base custom)) config-theme-name))

(def theme->warning-spec
  {"light" "rgb(150,108,30)"
   "light-ansi" "ansi:yellow"
   "dark-ansi" "ansi:yellowBright"
   "light-daltonized" "rgb(255,153,0)"
   "dark-daltonized" "rgb(255,204,0)"})

(def default-warning-spec "rgb(255,193,7)")

(defn warning-spec
  "Resolve the warning color for the current theme."
  []
  (let [custom (custom-theme)]
    (or (not-empty (get-in custom [:overrides :warning]))
        (theme->warning-spec (theme-name custom))
        default-warning-spec)))

(defn git [dir & args]
  (try
    (let [{:keys [exit out]}
          (apply shell {:dir dir :out :string :err :string :continue true}
                 "git" args)]
      (when (zero? exit) (not-empty (str/trim out))))
    (catch Exception _ nil)))

(defn branch [dir]
  (when-let [b (git dir "rev-parse" "--abbrev-ref" "HEAD")]
    (if (= "HEAD" b)
      (git dir "rev-parse" "--short" "HEAD")
      b)))

(defn branch-name [dir]
  (some->> (branch dir) (format "[%s]")))

(defn hex->rgb [s]
  (map #(Long/parseLong (apply str %) 16) (partition 2 s)))

(defn valid? [n]
  (<= 0 n 255))

(defn true-color [r g b]
  (format "\u001b[38;2;%d;%d;%dm" r g b))

(defn ansi-color [n]
  (format "\u001b[%sm" n))

(defn ansi-256-color [n]
  (ansi-color (str "38;5;" n)))

(def ansi-codes
  {"black" 30
   "blue" 34
   "cyan" 36
   "green" 32
   "magenta" 35
   "red" 31
   "white" 37
   "yellow" 33})

(defn name->ansi
  ([k] (name->ansi k nil))
  ([k & {:keys [bright?]}]
    (when-let [n (get ansi-codes k)]
      (ansi-color (cond-> n bright? (+ 60))))))

(defn spec->ansi
  "Translate a theme color spec into an SGR foreground escape.

  Covers every form Claude Code accepts, being `rgb(r,g,b)`, `#rrggbb`, `#rgb`,
  `ansi256(n)` and `ansi:<name>`. Returns `nil` for invalid spec."
  [spec]
  (condp re-matches spec
    #"rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)"
    :>> (fn [[_ & rgb]]
          (let [rgb (map parse-long rgb)]
            (when (every? valid? rgb) (apply true-color rgb))))
    #"#([0-9a-fA-F]{6})"
    :>> (fn [[_ hex]]
          (apply true-color (hex->rgb hex)))
    #"#([0-9a-fA-F]{3})"
    :>> (fn [[_ hex]]
          (apply true-color (-> hex (interleave hex) hex->rgb)))
    #"ansi256\((\d{1,3})\)"
    :>> (fn [[_ n]]
          (let [n (parse-long n)]
            (when (valid? n) (ansi-256-color n))))
    #"ansi:(.+)Bright"
    :>> (fn [[_ k]]
          (name->ansi k :bright? true))
    #"ansi:(.+)"
    :>> (fn [[_ k]]
          (name->ansi k))
    nil))

(defn colorize [s spec]
  (or (some-> spec spec->ansi (str s "\u001b[0m")) s))

(defn join [s xs]
  (str/join s (keep not-empty xs)))

(defn model-name [{display-name :display_name :keys [:id]}]
  (or display-name id))

(defn token-usage [tokens size]
  (join "/" [(if (number? tokens) (format "%.1fK" (/ tokens 1000.0)) "--")
             (when (number? size) (format "%dK" (-> size (/ 1000.0) int)))]))

(defn compact-warning [tokens]
  (when (and local? (some-> tokens (> compact-limit)))
    (colorize "⚠ compact" (warning-spec))))

(defn context-window [{tokens :total_input_tokens size :context_window_size}]
  (join " " [(token-usage tokens size) (compact-warning tokens)]))

(defn short-name [dir]
  (cond-> dir
    (str/starts-with? dir home) (str/replace-first home "~")))

(defn working-dir [{dir :current_dir} cwd]
  (when-let [d (some not-empty [dir cwd])]
    (join " " [(short-name d) (branch-name d)])))

; (def statusline [model-name token-usage working-dir])

(defn statusline [{ctx :context_window :keys [cwd model workspace]}]
  (join " · " [(model-name model)
               (context-window ctx)
               (working-dir workspace cwd)]))

(defn -main []
  (-> *in* json->clj statusline println))

(when (= *file* (System/getProperty "babashka.file"))
  (-main))
