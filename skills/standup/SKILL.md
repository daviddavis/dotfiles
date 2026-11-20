---
name: standup
description: Collect a daily standup update by asking about status, today's focus, needs, and blockers, then format it as Markdown with linked Jira issues. Use when preparing a standup or daily status update.
---

# Standup update

Ask the user these four questions in order, **one question per message**. Wait for
the user's answer before asking the next question. Do not present the full list
of questions at once. Collect all four answers before compiling the update:

1. **Status** - Are you on track or at risk?
2. **Today's focus** - What are you working on today?
3. **Needs** - Do you need a review, decision, handoff, or help from someone?
4. **Blockers** - Anything preventing progress?

If the user has already supplied an answer, reuse it and ask only the next
unanswered question. Do not invent answers or assume that an unanswered needs or
blockers question means "None". If an answer is unclear, ask one clarification
question and wait for the answer before continuing.

Once all four answers are available, return only the following Markdown inside a
fenced code block labeled `markdown`, so the Markdown is displayed literally and
can be copied without rendering. Keep the Markdown syntax and issue links intact
inside the code block; do not add backslash escapes. Replace the placeholders with
the user's answers. Preserve their meaning and important details. Use "None" when
the user explicitly indicates no needs or blockers.

```markdown
**Sprint goal/status:** <Status>
**Today’s focus:** <Today's Focus>
**Needs:** <Needs>
**Blockers:** <Blockers>
```

In every answer, convert standalone Jira issue keys into Markdown links to the
Red Hat Jira issue. A Jira issue key is a project key (an uppercase letter
followed by uppercase letters, digits, or underscores) followed by a hyphen and
one or more digits, such as `SAT-1234`, `RHEL-42`, or `OCPBUGS-9876`. For example,
`SAT-1234` becomes `[SAT-1234](https://redhat.atlassian.net/browse/SAT-1234)`.

Link every occurrence, including multiple issues in one answer, but:

- Only match whole keys, not keys embedded in a longer word or path.
- Leave existing Markdown links and URLs intact rather than nesting links or
  rewriting URLs.
- Do not link terms that look like keys but clearly are not Jira issues, such as
  `UTF-8`, `SHA-256`, `ISO-9001`, `CVE-2024-1234`, or version strings. If it is
  unclear whether a term is a Jira issue, leave it unlinked.
