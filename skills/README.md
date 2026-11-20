# Agent Skills

Agent-agnostic skills for working with upstream code hosted on GitHub. Each
skill is a directory that can be linked into the discovery path of any agent
that supports skills.

## Structure

```text
skills/
  <skill-name>/
    SKILL.md
    scripts/       # Optional executable helpers
    references/    # Optional supporting documentation
    assets/        # Optional templates and static files
```

Other AI customizations, such as prompts, instructions, or agent definitions,
should get their own top-level directories in the dotfiles repo alongside
`skills/`.

## Skills

| Skill | Purpose |
| --- | --- |
| `address` | Evaluate and address feedback on a GitHub pull request. |
| `commit` | Commit repository changes using the configured branch and message conventions. |
| `review-pr` | Review a GitHub pull request for actionable defects and missing tests. |
| `standup` | Collect a daily standup update and format Markdown with linked Jira issues. |

## Installation

These skills are linked into place by `mise dot apply` from the dotfiles root,
via the `[dotfiles]` entries in [`mise.toml`](../mise.toml):

- `~/.agents/skills` links to the whole `skills/` directory, for Pi and other
  agents that use that discovery path.
- `~/.claude/skills/<name>` links to each skill individually, because Claude
  Code reads only `~/.claude/skills/`, and that directory also holds `synced/`
  and plugin skills.

For one project only, link into that repository's `.claude/skills/` instead.
Avoid `/import`: it copies the files, so the snapshot goes stale.

## Adding A Skill

1. Create `skills/<skill-name>/SKILL.md`.
2. Set the frontmatter `name` to the directory name.
3. Give the skill a specific description that makes its intended use clear.
4. Keep supporting scripts, references, and assets inside the skill directory.
5. Avoid tool-specific behavior unless the skill explicitly targets that tool.
6. Add a `~/.claude/skills/<skill-name>` entry to `mise.toml`, run
   `mise dot apply`, and add a row to the [Skills](#skills) table.

To update a skill, edit `SKILL.md` in place; symlinked installs pick it up next
session. Renaming a skill directory means updating its `mise.toml` entry.

### Frontmatter

Only `name` and `description` are required. Unrecognized keys are ignored by
agents that do not support them.

| Key | Effect |
| --- | --- |
| `name` | Must match the directory name. |
| `description` | All the agent sees before loading the body — name concrete triggers, not abstractions. |
| `argument-hint` | Placeholder shown next to the slash command. |
| `user-invocable` | Exposes the skill as `/<name>`. Defaults to true. |
| `disable-model-invocation` | Hides it from the agent's skill list so it only runs when invoked explicitly. |
| `allowed-tools` | Restricts the skill to specific tools. |
| `model` | Pins the skill to a particular model. |

Use `disable-model-invocation: true` for skills that take an argument or
perform a write, as `address`, `commit`, and `review-pr` do; the cost is that
the agent will never reach for them on its own. Omit it for skills like
`standup` that should be offered automatically.
