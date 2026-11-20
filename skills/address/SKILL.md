---
name: address
description: Address review feedback on a GitHub pull request
argument-hint: "PR URL"
user-invocable: true
disable-model-invocation: true
---

The user will provide a GitHub pull request URL of the form
`https://github.com/<owner>/<repo>/pull/<number>`. If they have not provided
one, ask for it before doing anything else.

## Steps

1. Parse the URL to extract `owner`, `repo`, and `pullRequestNumber`.

2. Fetch all PR review threads using GitHub tools when available. Otherwise use
    the authenticated GitHub CLI. The user is already signed in; do not run
    `gh auth login` yourself. If authentication fails, ask the user to run
    `gh auth login` and do not retry blindly.

   ```bash
    gh api graphql --paginate \
       -f owner=<owner> \
       -f repo=<repo> \
       -F number=<number> \
       -f query='
          query(
             $owner: String!
             $repo: String!
             $number: Int!
             $endCursor: String
          ) {
             repository(owner: $owner, name: $repo) {
                pullRequest(number: $number) {
                   reviewThreads(first: 100, after: $endCursor) {
                      nodes {
                         id
                         isResolved
                         isOutdated
                         path
                         line
                         originalLine
                         comments(first: 100) {
                            nodes {
                               author { login }
                               body
                               url
                            }
                         }
                      }
                      pageInfo { hasNextPage endCursor }
                   }
                }
             }
          }
       ' > /tmp/pr-threads.json
   ```

3. Filter the threads. Ignore:
    - Resolved threads (`isResolved: true`).
   - Bot/PR-assistant noise that contains no actionable suggestion.

    Keep unresolved threads that contain a real review point. Treat outdated
    threads as context and discard them only after verifying that the underlying
    concern no longer applies. For each kept thread, record the thread ID, file
    path, line or original line, author, URL, and review point in plain English.

4. Investigate each comment before judging it. Read the code the comment
   refers to, plus enough surrounding context to understand it. Do not edit
   anything during this step. Then classify every actionable comment as one of:
   - **Accept** - correct and worth doing.
   - **Accept with modification** - the underlying point is valid but the
     suggested code is suboptimal (e.g. inline imports, unnecessary scope
     changes). Propose a cleaner version.
   - **Reject** - wrong, redundant, out of scope, or a style preference that
     conflicts with the codebase. Explain why in the plan; do not reply on the
     PR.

   Do NOT auto-apply suggestions just because they came from a bot or a
   reviewer. AI-generated PR comments in particular are frequently wrong or
   low-value; treat them with the same skepticism as any other review.

5. Present the plan before editing: a short list of each actionable comment
   with the accept/modify/reject decision. For modifications, describe the
   version you would apply. For rejections, give me a rejection reason (1-2
   sentences in markdown). Include any suggestions for tests if you think they
   are needed.

6. Stop and wait for the user's feedback. Do not edit files, post PR replies,
   or commit until the user has approved the plan. If they change a decision,
   ask a question, or reject part of the plan, update the plan and present it
   again if anything changed. Only what the user approves moves forward.

7. After receiving approval, apply only the approved changes. Match existing
   style and conventions from
   `AGENTS.md`, `copilot-instructions.md`, or any `.instructions.md` files in
   the repo.

8. Validate. Run the project's lint and test commands (look for a `Makefile`,
   `pyproject.toml`, `package.json`, etc. - do not assume). Fix any failures
   before committing. If a fix would go beyond the approved changes, describe
   it and ask first.

9. After making any changes, ask if you should commit or push. Wait for
   confirmation before doing so.

10. Commit and push following these rules:
    - Do not amend or force-push.
    - Commit on the current branch, unless it is `main`. Never commit directly
      to `main`; create a topic branch instead.
      - Follow the GitHub repository's branch naming conventions. Otherwise use
        a concise kebab-case name without a personal prefix.
    - Use a concise, high-level commit message. Avoid enumerating changes unless
      they are unrelated.

## Constraints

- Never resolve PR threads programmatically; the user does that.
- If a comment requires changes outside the files touched by the PR, flag it
  and ask before expanding scope.