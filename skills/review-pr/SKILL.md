---
name: review-pr
description: Review a GitHub pull request for bugs, regressions, risks, and missing tests
argument-hint: "PR URL"
user-invocable: true
disable-model-invocation: true
---

The user will provide a GitHub pull request URL of the form
`https://github.com/<owner>/<repo>/pull/<number>`. If no PR URL was provided,
ask for it before doing anything else.

## Goal

Perform a read-only code review. Prioritize correctness bugs, behavioral
regressions, security and reliability risks, compatibility problems, and
missing or inadequate tests. Do not modify files, submit a review, add comments,
resolve threads, approve or request changes, commit, push, or change branches.

## Steps

1. Parse the URL and identify the owner, repository, and pull request number.

2. Verify that the current workspace corresponds to the PR repository by
   inspecting its Git remotes. If it does not, stop and ask the user to open or
   clone the correct repository. Do not review an unrelated checkout.

3. Read the repository's applicable guidance, including `AGENTS.md`,
   `copilot-instructions.md`, `.instructions.md` files, and relevant build or
   test configuration.

4. Fetch PR metadata and the exact base and head commit IDs without checking out
   or changing branches.

   Use GitHub tools when available. Otherwise use the authenticated GitHub CLI.
   The user is already signed in; do not run `gh auth login` yourself. If
   authentication fails, ask the user to run `gh auth login` and do not retry
   blindly.

   ```bash
   gh pr view <url> --json number,title,body,author,baseRefName,baseRefOid,headRefName,headRefOid,files,commits,reviews,statusCheckRollup
   ```

5. Fetch the exact base branch and `refs/pull/<number>/head` from the matching
   GitHub remote. Verify the fetched commit IDs against the PR metadata, then
   inspect the complete diff using the merge base (`<base>...<head>`). Do not
   rely only on the PR description, commit messages, or changed-file list. Do
   not check out either commit.

6. Review each changed file in context. Follow important calls into unchanged
   code when needed to verify behavior. Check relevant tests to determine
   whether changed behavior is covered, and distinguish a real defect from a
   deliberate contract or established repository convention.

7. Use focused, read-only validation when it can confirm or disprove a suspected
   issue. Do not run commands that modify tracked files, generated output,
   external services, or persistent data. Do not fix the PR.

8. Report only actionable findings that the author should address. Each finding
   must:

   - Be labeled `Critical`, `High`, `Medium`, or `Low`.
   - Have a concise title describing the defect.
   - Cite the changed file and the smallest useful line or line range.
   - Explain the concrete failure mode and when it occurs.
   - Suggest the direction of a fix without writing a full replacement patch.

   Do not report formatting preferences, speculative concerns without a
   plausible failure path, pre-existing issues unrelated to the diff, or praise
   disguised as a finding. Combine findings that share the same root cause.

## Output Format

List findings first, ordered from highest to lowest severity. Use this format:

```markdown
## Findings

### [High] Concise defect title
`path/to/file.ext:line`

Explain the failure mode, triggering conditions, and impact. State the
recommended fix direction.

## Questions

- Include only questions that block a confident conclusion.

## Summary

Briefly state what the PR changes and which validation was performed.
```

If there are no findings, say `No actionable findings.` and still include the
summary. Mention any validation that could not be performed and the remaining
review risk.

## Constraints

- Treat existing review comments as context, not as facts; independently verify
  them.
- Base every finding on code in the PR diff, while citing unchanged code only as
  supporting context.
- Do not expose credentials, tokens, or sensitive PR data in the response.
- Remain read-only throughout the review.