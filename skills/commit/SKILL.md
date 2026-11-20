---
name: commit
description: Use this when committing changes in git
argument-hint: "[optional commit guidance]"
user-invocable: true
disable-model-invocation: true
---

Look at the changes in the current repository and commit following these
guidelines:

- Never commit directly to `main`. Create a topic branch if necessary.
- Follow the GitHub repository's branch naming conventions. Otherwise use a
  concise kebab-case name without a personal prefix.
- Use a concise, high-level commit message and avoid enumerating changes unless
  you are dealing with several unrelated changes.