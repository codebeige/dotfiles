# Code style

## Line length

Keep every line in a code file to 80 columns or fewer. This is a hard limit,
not a target to average out. It covers code, comments, docstrings, string
literals and data, in every language.

Reformat the line rather than let it run over. Break the expression across
lines, bind an intermediate to a name, or shorten the wording of the prose.

Bad:

```clojure
(defn warning-spec
  "Resolve the warning color the TUI paints the auto mode indicator in, reading it from the global config."
  []
  (let [custom (read-json (fs/path home ".claude" "themes" (str configured ".json")))]
    ...))
```

Good:

```clojure
(defn warning-spec
  "Resolve the warning color the TUI paints the auto mode indicator in.

  The statusline payload carries no theme, so read it from the global config."
  []
  (let [themes (fs/path home ".claude" "themes")
        custom (read-json (fs/path themes (str configured ".json")))]
    ...))
```

A token that cannot be split is the one exception, such as a long URL or an
opaque hash. Put it on a line of its own so it is the only thing that overruns.

When editing a file that already exceeds 80 columns, hold new and touched lines
to the limit. Leave the rest alone unless the user asks for a reformat.
