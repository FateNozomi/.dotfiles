# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# editor
export EDITOR=/opt/nvim-linux-x86_64/bin/nvim

# linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/opt/win32yank/bin"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# dotnet
export DOTNET_ROOT=/usr/lib/dotnet


# Check if working directory is windows or linux
function isWinDir {
  case $PWD/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}

# Wrap the git command to either run windows git or linux
function git {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}
