# Version control

Version control belongs to the user, not to Claude.

Never run a command that changes repository state or history unless the user
asked for it in that message. That covers `git commit`, `git push`, `git tag`,
creating or switching branches, `git merge`, `git rebase`, `git reset`,
`git revert`, `git stash`, and `gh pr create`.

Never ask for a commit either. Do not offer to commit, do not propose it as a
next step, and do not end a response with a note about what is still
uncommitted. Finish the work, leave it in the working tree, and say nothing
about committing it.

Read-only inspection needs no permission and stays useful: `git status`,
`git diff`, `git log`, `git show`, `git blame`.

When the user does ask for a commit, do that one operation and stop. A commit is
not permission to push. One commit is not standing permission for the next.
