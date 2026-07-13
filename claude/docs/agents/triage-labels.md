# Triage Labels

The skills speak in terms of five canonical triage roles. This file maps those roles to the actual label strings used in the active repo's issue tracker.

| Label in mattpocock/skills | Label in our tracker | Meaning                                  |
| -------------------------- | -------------------- | ---------------------------------------- |
| `needs-triage`             | `needs-triage`       | Maintainer needs to evaluate this issue  |
| `needs-info`               | `needs-info`         | Waiting on reporter for more information |
| `ready-for-agent`          | `ready-for-agent`    | Fully specified, ready for an AFK agent  |
| `ready-for-human`          | `ready-for-human`    | Requires human implementation            |
| `wontfix`                  | `wontfix`            | Will not be actioned                     |

When a skill mentions a role (e.g. "apply the AFK-ready triage label"), use the corresponding label string from this table.

> **Setup note (global default)**: `wontfix` exists on most GitHub repos out of the box. The four others (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`) typically do not — create them per-repo via `gh label create <name> --description "..."` the first time the `triage` skill runs against a new repo.

Edit the right-hand column to match whatever vocabulary you actually use in a given repo.
