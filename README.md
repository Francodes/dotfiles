# dotfiles

Personal macOS dotfiles: shell, git, tmux, editor, and AI agent configs, installed via symlinks.

## Layout

Symlinking is driven by `Rakefile`, task `rake install` (also called from `install.sh`).

Top-level entries in the `FILES` array are symlinked straight into the home directory:

- `agents` → `~/.agents`
- `config` → `~/.config`
- `gemrc` → `~/.gemrc`
- `gitignore` → `~/.gitignore`
- `gitconfig` → `~/.gitconfig`
- `irbrc` → `~/.irbrc`
- `tmux.conf` → `~/.tmux.conf`
- `zsh` → `~/.zsh`
- `zshrc.custom` → `~/.zshrc.custom`

`claude/` is different: its contents (`CLAUDE.md`, `settings.json`, `statusline-command.sh`,
`hooks`, `docs`) are symlinked individually into `~/.claude`, one entry at a time, rather than
symlinking `~/.claude` itself. This is deliberate — `~/.claude` also holds untracked runtime
state (history, sessions, projects) that a whole-directory symlink would clobber.

`agents/` is a shared agent skills library (`agents/skills`); `~/.claude/skills` is a
separate symlink into `~/.agents/skills`, so Claude Code picks up the same skills.

## AI agent configs

- `claude/` — Claude Code (`CLAUDE.md`, settings, hooks, docs), linked into `~/.claude` as above.
- `config/AGENTS.md` — global agent instructions, read by any agent that honors `~/.config/AGENTS.md`.
  `~/.claude/CLAUDE.md` is just `@~/.config/AGENTS.md`, so Claude Code picks it up too.
- `config/codex/` — Codex CLI config.
- `config/opencode/` — opencode config, including `plugins/`.
- `config/herdr/` — herdr config.

## Install

```bash
./install.sh
```

This:

1. On Darwin, runs `macos/install.sh` (installs Homebrew if missing, copies fonts,
   runs `brew bundle` against `macos/Brewfile`, then `macos/defaults.sh` for
   `defaults write` system preferences — Finder, Dock, trackpad).
2. Runs `rake install` to lay down the symlinks described above.
3. Installs vim-plug and runs `:PlugInstall` for Neovim.
4. Runs `npm install` for local Node tooling.
5. Appends `source ~/.zshrc.custom` to `~/.zshrc` if it isn't already sourced there.

## Deliberately untracked

`.gitignore` is an allowlist (`/*` then explicit `!` exceptions), so anything not
explicitly un-ignored stays local. Notable exclusions:

- `config/gh/` — GitHub CLI credentials.
- `config/claude/` — Claude Code runtime state (history, sessions, todos), as distinct
  from the tracked `claude/` directory described above.
- herdr logs and sockets (`config/herdr/herdr-client.log`, `*.sock`, `session.json`).
- opencode `node_modules/`, `logs/`, lockfiles, and `*.uidotsh.*` scratch files.
- machine-local secrets: `zsh/config` sources `~/.zshrc.local` if present, for anything
  that shouldn't be committed (API keys, per-machine overrides).

## License

MIT — see `LICENSE`.
