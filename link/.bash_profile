
PATH=~/.dotfiles/bin:$PATH
export PATH

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private local if it exists
if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
fi
