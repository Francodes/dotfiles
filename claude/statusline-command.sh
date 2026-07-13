#!/usr/bin/env bash
# Claude Code status line script

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
style=$(echo "$input" | jq -r '.output_style.name')

# Git status
git_status=""
if git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
    git_status="${branch}*"
  else
    git_status="$branch"
  fi
fi

# Context window usage
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Claude.ai subscription rate limits
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Build the status line
printf "\033[2m%s" "$(basename "$cwd")"

if [ -n "$git_status" ]; then
  printf " %s" "$git_status"
fi

if [ "$style" != "default" ]; then
  printf " [%s]" "$style"
fi

printf " • %s" "$model"

if [ -n "$ctx_used" ]; then
  printf " • ctx:%.0f%%" "$ctx_used"
fi

if [ -n "$five_pct" ]; then
  printf " • 5h:%.0f%%" "$five_pct"
fi

if [ -n "$week_pct" ]; then
  printf " • 7d:%.0f%%" "$week_pct"
fi

printf "\033[0m"
