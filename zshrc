source ~/.zsh/aliases
source ~/.zsh/config

if [[ -f /opt/dev/dev.sh ]]
then
  source /opt/dev/dev.sh
  [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
  PATH=/opt/homebrew/sbin:$PATH
else
  [[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
fi

PATH=~/.bin:$PATH

GPG_TTY=$(tty)
export GPG_TTY

if [ "$TMUX" = "" ]; then tmux new -As0; fi
