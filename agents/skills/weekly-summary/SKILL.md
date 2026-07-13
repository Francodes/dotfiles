---
name: weekly-summary
description: |
  Generate a prose narrative weekly summary of work done, grouped by theme.
  Use when: the user asks "how did it go this week?", "weekly summary",
  "what did I do this week?", or similar retrospective questions.
---

# Weekly Summary

Generate a prose, conversational weekly summary of the user's work for the past week, suitable for pasting into a Trix editor via a markdown-to-trix converter.

## Date Range

- Default range: **last Saturday through Friday** (a full Mon–Fri work week, bookended by the weekend).
- If today is Saturday, the range is the 7 days ending yesterday (Friday).
- If the user specifies a different range, use that instead.

## Data Collection

### Step 1 — Gather commits

Run this to get all commits by the current git user across all branches:

```sh
git log --all --author="$(git config user.name)" --since="<start>" --until="<end>" --format="%h|%ad|%s|%D" --date=short
```

### Step 2 — Extract PR numbers

Parse `#NNNN` from commit messages and deduplicate.

### Step 3 — Fetch PR titles

For each PR number, fetch the title via `gh pr view`:

```sh
gh pr view <number> --json title --jq '.title'
```

Use PR titles (not commit messages) as the source of truth for what shipped — they may differ.

### Step 4 — Identify WIP / unmerged work

Look for commits on non-default branches that don't have an associated merged PR (WIP commits, feature branches in progress). These belong in the "still in flight" mention at the end.

## Output Format

Output **prose narrative paragraphs** as raw markdown, wrapped in a fenced code block so the user can copy it. No bulleted PR lists, no headings, no PR links — this is a written summary, not a changelog.

### Structure

Three short paragraphs, in this order:

1. **One-line opener** — frames the week at a glance (e.g., "A heavy Admin v2 week with cleanups around it."). If the user mentions a personal/contextual event (travel, conference, offsite), this is where it goes. Otherwise, lead with the dominant theme of the week.
2. **Smaller wins paragraph** — cleanups, polish, side fixes, tooling. Conversational sentences, not a bulleted list. Mix multiple themes if relevant.
3. **Main focus paragraph** — the area where the bulk of the energy went. Ends with what's still in flight ("Still in flight: …").

### Tone

- Conversational and punchy — short sentences, low jargon, an at-a-glance feel.
- Skip articles where it tightens the rhythm ("MRR USD-normalized" not "MRR was USD-normalized").
- Use em-dashes and colons to chain related ideas instead of stacking commas.
- Group related work into single phrases rather than enumerating every PR.
- Avoid the phrase "shipped" repeatedly; vary verbs (landed, migrated, fixed, polished, reconciled, wired up).

### Example shape

```
A heavy Admin v2 week with cleanups and new agent tooling around it.

A few smaller wins along the way: subprocess descriptions show on Core Process views, inbox feed read-sync is properly scoped, and a TodoSet overflow got fixed. New agent tooling landed too — Playwright MCP, `bin/screenshot`, and a Dashkit migration plan with a parity regression suite.

The real energy went into Admin v2. Reconciled the home dashboard KPIs with ChartMogul and v1 — MRR USD-normalized, past_due excluded, drilldowns lined up with their metrics. Polished a stack of small things: date pickers with preset ranges, form action defaults, a dialog primitive, Masquerade-as bridges. Monthly Payouts got a refactor — Report PORO + sub-resource controllers. Still in flight: Phase 1 of the Bootstrap-only SCSS entry, and dropping the Processes v2 tables next.
```

## Grouping Rules

- **Group by theme, not by day or by PR.** Look at PR titles and the areas of code they touch to identify natural narrative threads.
- **The main focus paragraph** is whatever cluster has the most PRs or clearest narrative arc (often a feature area).
- **The smaller wins paragraph** is a mix: unrelated bug fixes, infrastructure, tooling, design skill updates, smaller features.
- **WIP** is mentioned in a closing "Still in flight: …" sentence — branch names only if useful, otherwise just describe the work.

## Rules

- Output a single fenced code block containing 2–3 prose paragraphs.
- **No bulleted PR lists, no PR links, no per-PR line items.** This is a written summary, not a changelog.
- Use the actual PR title (or work described) as a source of truth, but rewrite into conversational prose — don't quote titles verbatim.
- Do NOT include Dependabot or bot-authored PRs.
- Do NOT include merge commits.
- Do NOT invent personal context (travel, conferences, social events) — only include if the user mentions it or it's evident from the conversation.
- If the user provides an example structure or draft, mirror its tone and rhythm, but use the actual git/Strety data for content.
