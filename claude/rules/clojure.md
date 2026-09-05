---
paths:
  - "**/*.clj"
  - "**/*.cljs"
  - "**/*.cljc"
  - "**/*.bb"
---

# Clojure conventions

Follow the [Clojure Style Guide](https://guide.clojure.style) by default, for
layout, naming, idioms and all. When unsure about a formatting or naming
question, assume the guide has an opinion and match it rather than the
surrounding code. The rules below apply to every form worth documenting. Where
this file is more specific than the guide, this file wins.

## Prefer docstrings

[Prefer Docstrings](https://guide.clojure.style/#prefer-docstrings): if a form
supports a docstring directly, use it in preference to `:doc` metadata. Extend
that to comments. Never document a form with a preceding `;;` comment either.

Bad:

```clojure
;; Returns the user's full name
(defn full-name [user] ...)

(defn full-name
  ^{:doc "Returns the user's full name."}
  [user] ...)
```

Good:

```clojure
(defn full-name
  "Returns the user's full name."
  [user] ...)
```

`def` has a docstring slot too, between the name and the value.

Bad:

```clojure
;; Warn well before the 64K cap on local Ollama sessions.
(def compact-limit 50000)
```

Good:

```clojure
(def compact-limit
  "Warn well before the 64K cap on local Ollama sessions."
  50000)
```

`ns`, `defmacro`, `defmulti` and `defprotocol` all take one as well. Document
the `defmulti`. A `defmethod` has nowhere to put a docstring.

```clojure
(defmulti area "Area of a shape, dispatched on its `:kind`." :kind)
```

Metadata is the fallback, not the default: reach for `^{:doc "..."}` only when a
form defines a var but has no docstring slot, such as `deftest`.

Bad:

```clojure
;; Full names join first and last.
(deftest full-name-test ...)
```

Good:

```clojure
(deftest ^{:doc "Full names join first and last."} full-name-test ...)
```

## Docstring summary

[Docstring Summary](https://guide.clojure.style/#docstring-summary): let the
first line be a complete, capitalized sentence that describes the var on its
own, so editors and IDEs can show it as a one-line summary. Never let the
summary sentence wrap.

Always separate the summary from the detail with an empty line. This departs
from the guide, whose own examples run the detail on immediately.

Bad, the summary wraps:

```clojure
(defn frobnitz
  "This function does a frobnitz. It will do gnorwatz to
  achieve this, but only under certain circumstances."
  []
  ...)
```

Bad, no empty line after the summary:

```clojure
(defn frobnitz
  "This function does a frobnitz.
  It will do gnorwatz to achieve this, but only under certain
  circumstances."
  []
  ...)
```

Good:

```clojure
(defn frobnitz
  "This function does a frobnitz.

  It will do gnorwatz to achieve this, but only under certain
  circumstances."
  []
  ...)
```

## Document references

[Document References](https://guide.clojure.style/#document-references): wrap
var, namespace and library names in backticks so tooling can identify them, and
in `[[..]]` when you want a link to them. Positional arguments get backticks
too. See [Document Positional
Arguments](https://guide.clojure.style/#document-pos-arguments).

Bad:

```clojure
(defn wombat
  "Acts much like clojure.core/identity except when it doesn't.

  Takes x as an argument and returns that. If it feels like it.
  See also kangaroo."
  [x]
  ...)
```

Good:

```clojure
(defn wombat
  "Acts much like `clojure.core/identity` except when it doesn't.

  Takes `x` as an argument and returns that. If it feels like it.
  See also [[kangaroo]]."
  [x]
  ...)
```

Remarks *inside* a body still belong in `;` comments. These rules are about a
form's own documentation.

## Nil punning

[Nil Punning](https://guide.clojure.style/#nil-punning): test a collection for
contents with `seq`, not with a negated `empty?`. An empty collection is itself
truthy, so `empty?` needs a negation to become a condition, while `seq` already
returns `nil` when there is nothing left.

Bad:

```clojure
(when-not (empty? coll)
  (prn (first coll)))

(if (not (empty? coll)) :some :none)
```

Good:

```clojure
(when (seq coll)
  (prn (first coll)))

(if (seq coll) :some :none)
```

`clojure.core` asks for this in `empty?`'s own docstring:

```clojure
(defn empty?
  "Returns true if coll has no items - same as (not (seq coll)).
  Please use the idiom (seq x) rather than (not (empty? x))"
  [coll] (not (seq coll)))
```

So `empty?` earns its place only in the positive test, where it is the plainer
of the two. Prefer `(when (empty? coll) ...)` over `(when-not (seq coll) ...)`.

When the collection is wanted as a value rather than as a condition, reach for
`not-empty`, which returns the collection itself or `nil`.

```clojure
(or (not-empty (:theme config)) "dark")
```

## Nested threading

Never write a threading form as a step of another threading form. This covers
`->`, `->>`, `some->`, `some->>`, `cond->` and `cond->>` in any combination,
including a macro nested in itself. Each one threads into a different position,
so a reader has to hold two rules at once to follow a single pipeline.

Bad:

```clojure
(-> (interleave hex hex) (->> (apply str)) hex->rgb)

(->> xs (map inc) (-> vec))
```

Good, bind the awkward step:

```clojure
(let [digits (apply str (interleave hex hex))]
  (hex->rgb digits))
```

`as->` is the exception. It exists to name the threaded value for a step that
does not fit, so it may appear inside another threading form, and other
threading forms may appear inside it.

```clojure
(-> (interleave hex hex)
    (as-> chars (apply str chars))
    hex->rgb)
```

A function literal is no escape. Threading inside one that is itself a step of
a thread reads just as badly, so give the inner pipeline a name and pass that.

Bad:

```clojure
(->> paths (map #(-> % fs/file slurp str/trim)))
```

Good:

```clojure
(defn contents [path]
  (-> path fs/file slurp str/trim))

(->> paths (map contents))
```

## Reaching into maps

Never thread keyword lookups to walk a nested map. Say where you are going in
one step with `get-in`, which states the whole path in one place and reads as
the lookup it is.

Bad:

```clojure
(-> custom :overrides :warning)
```

Good:

```clojure
(get-in custom [:overrides :warning])
```

A single key needs neither. Call the keyword on the map.

Bad:

```clojure
(-> config :theme)
```

Good:

```clojure
(:theme config)
```
