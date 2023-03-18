
PATH=~/.dotfiles/bin:$PATH
export PATH

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

complete -C /opt/homebrew/bin/terraform terraform
