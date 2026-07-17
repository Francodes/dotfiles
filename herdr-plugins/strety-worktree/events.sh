#!/usr/bin/env bash
set -euo pipefail

# No-ops in repos without bin/worktree, so the plugin is safe to keep global.

mode="${1:?usage: events.sh created|removed}"
ev="${HERDR_PLUGIN_EVENT_JSON:-}"
[ -n "$ev" ] || exit 0

field() { printf '%s' "$ev" | jq -r "$1 // empty" 2>/dev/null || true; }

case "$mode" in
  created)
    checkout="$(field '.data.workspace.worktree.checkout_path')"
    [ -n "$checkout" ] && [ -x "$checkout/bin/worktree" ] || exit 0
    ws="$(field '.data.workspace.workspace_id')"
    [ -n "$ws" ] || exit 0
    pane="$(herdr pane list --workspace "$ws" 2>/dev/null | jq -r '.result.panes[0].pane_id // empty')"
    [ -n "$pane" ] || exit 0
    # Run setup visibly in the new workspace's pane instead of headless, so progress
    # and failures (e.g. Docker stack down) are in front of the user. The sleep lets
    # the fresh pane's shell finish starting before text arrives.
    sleep 1
    herdr pane send-text "$pane" 'bin/worktree setup'
    herdr pane send-keys "$pane" enter
    ;;
  removed)
    # The checkout is already deleted; derive the repo root from herdr's worktree
    # directory convention (<repo>/.claude/worktrees/...) and prune unclaimed leftovers.
    path="$(field '.data.worktree.path')"
    case "$path" in
      */.claude/worktrees/*) repo_root="${path%%/.claude/worktrees/*}" ;;
      *) exit 0 ;;
    esac
    [ -x "$repo_root/bin/worktree" ] || exit 0
    cd "$repo_root"
    bin/worktree prune
    ;;
esac
