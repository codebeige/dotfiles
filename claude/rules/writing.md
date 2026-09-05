# Writing

Never use an em-dash or a semicolon. This holds in every context: prose,
docstrings, code comments, commit messages, PR descriptions, and replies in
chat.

Start a new sentence instead. Where a new sentence is not applicable or
practicable, use a comma.

Bad:

> The payload carries no theme, so read it from the global config; custom
> themes live in `~/.claude/themes/<slug>.json`.

Good:

> The payload carries no theme, so read it from the global config. Custom
> themes live in `~/.claude/themes/<slug>.json`.

Bad:

> Follow the style guide by default — layout, naming, idioms and all.

Good:

> Follow the style guide by default, for layout, naming, idioms and all.

This is about punctuation, not syntax. A `;` that is Clojure comment syntax, a
statement terminator, or a separator inside code or a format string is code and
stays as it is.
