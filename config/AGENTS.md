# Personal Preferences

## Git Commits
- Never add `Co-Authored-By` lines to commit messages.

## Agent skills

These are personal/experimental — not committed to any project repo yet. Each section is a one-line summary; details live in `~/.claude/docs/agents/`.

### Issue tracker

Default to GitHub Issues (via `gh` CLI), inferring the repo from `git remote -v`. See `~/.claude/docs/agents/issue-tracker.md`.

### Triage labels

Canonical defaults: `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`. See `~/.claude/docs/agents/triage-labels.md`.

### Domain docs

Single-context: `CONTEXT.md` + `docs/adr/` at the repo root. Proceed silently if absent. See `~/.claude/docs/agents/domain.md`.
