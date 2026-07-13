# frozen_string_literal: true

require 'rake'
require 'erb'

FILES = [
  'agents',
  'config',
  'gemrc',
  'gitignore',
  'gitconfig',
  'irbrc',
  'tmux.conf',
  'zsh',
  'zshrc.custom'
].freeze

# Linked individually into ~/.claude — the directory itself holds untracked
# runtime state (history, sessions, projects) and must never be replaced whole.
CLAUDE_FILES = [
  'CLAUDE.md',
  'settings.json',
  'statusline-command.sh',
  'hooks',
  'docs'
].freeze

desc "install the dot files into user's home directory"
task :install do
  FILES.each do |file|
    replace_file(file)
  end

  system %(mkdir -p "$HOME/.claude")
  CLAUDE_FILES.each do |file|
    system %(rm -rf "$HOME/.claude/#{file}")
    system %(ln -s "$PWD/claude/#{file}" "$HOME/.claude/#{file}")
  end

  system %(rm -rf "$HOME/.claude/skills")
  system %(ln -s "$HOME/.agents/skills" "$HOME/.claude/skills")
end

def replace_file(file)
  system %(rm -rf "$HOME/.#{file.sub('.erb', '')}")
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %(ln -s "$PWD/#{file}" "$HOME/.#{file}")
  end
end
