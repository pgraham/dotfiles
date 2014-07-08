
PATH=~/.dotfiles/bin:$PATH
export PATH

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi
