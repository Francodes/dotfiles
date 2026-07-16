---
name: buttery
description: >
  Readability polish in the 37signals/DHH style — make finished code buttery: easy to read,
  well named, well factored, no behavior change. Use when the user says "buttery", "make it
  more readable", "make DHH proud", "clean this up so it's simple to understand", "basecamp/fizzy
  style", or asks how DHH would judge some code. Not for bug hunting, efficiency, or minimalism.
---

# Buttery

A readability pass over working code. The feature is done and verified; this pass makes the
code a pleasure to read. Behavior must not change.

## Scope

Default: the branch diff (`git diff origin/master...HEAD`). If the user names a file, dir, or
subsystem, use that instead. Include a temp-code sweep of the scope: debug leftovers, dead
paths, scaffolding that never got removed.

## Modes

- **Default**: critique → align → apply.
- **Review-only**: if the user says "no changes", "just look", "how would DHH judge this" —
  deliver the judgment (step 1–2 below) and stop. No edits.

## Procedure

1. **Fresh critical eyes.** Re-read the target as if seeing it for the first time. Name
   *specific* pain — naming collisions, mechanism-names, indirection, comment noise,
   asymmetric parallel code. Generic advice is a failure; every point must cite a file/line.
2. **Ground the taste in real code.** Consult basecamp/fizzy (clone into the scratchpad if not
   already there) for the target's genre — seeds, controllers, concerns, JS. Also apply the
   project's own principles doc (AGENTS.md/CLAUDE.md) if present; don't restate it, follow it.
3. **Align before touching files.** Present a "Now → Buttery" table of the proposed renames,
   moves, and refactors, with honest tradeoffs (churn size, mechanical vs judgment changes).
   Wait for a go-ahead when the changes are structural (file moves, renames across callers);
   proceed directly only for local, single-file polish.
4. **Execute with rename discipline.** Grep every reference before renaming anything. Use
   `git mv` so history follows the file. No logic changes ride along.
5. **Verify zero behavior change.** Re-run the affected tests/commands; compare output (and
   timings when relevant). Report plainly: "same behavior, just readable."
6. **Commit separately** (when the user wants a commit): its own commit, message states it's a
   readability pass with no behavior change.

## Taste checklist

- A public method reads as a table of contents of well-named private methods.
- Names come from the domain, not the mechanism (`Seeds::Build`, not `SeedHarness`).
- Guard clauses over nesting; expressive one-liners (`presence`, `then`) where they read well.
- Parallel code looks parallel — symmetry is a readability feature.
- Comments get deleted by refactoring until they're unnecessary.
- Vanilla Rails, fat models, POROs — no service-object ceremony.
- Duplication over the wrong abstraction (Metz). Extraction needs three occurrences, not two.
- Adding a well-named method to clarify intent is a win — this is expressiveness, not golf.

## Non-goals

Not `/simplify` (reuse/efficiency), not ponytail (minimalism), not a bug hunt. If a real bug
surfaces during the read, report it — don't fix it in the readability commit.
