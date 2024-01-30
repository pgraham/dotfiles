# dotfiles

1. Create SSH credentials and upload to Github
1. Clone repo and run setup

   ```sh
   bash -c "$(curl -fsSL https://raw.github.com/pgraham/dotfiles/master/bin/dotfiles)"
   ```

## Manual

### MacOS

1. Install iTerm2

### Ubuntu

1. Install zsh

   [Oh-my-zsh zsh install instructions](nvim/.config/nvim/plugin/packer_compiled.lua)

   ```sh
   sudo apt install zsh
   chsh -s $(which zsh)
   ```

### Common

1. Install homebrew
1. Install oh-my-zsh
1. Install zsh-syntax-highlighting, zsh-autosuggestions (via homebrew)
1. Install neovim (via homebrew)

   ```sh
   # Macos
   $ brew install neovim # or
   $ brea install --HEAD neovim # for dev version

   # Ubuntu
   $ sudo add-apt-repository ppa:neovim-ppa/unstable
   $ sudo apt update
   $ sudo apt install neovim
   ```

1. Install tmux

   ```sh
   brew install tmux
   ```

1. Install stow

   ```sh
   brew install stow
   ```

1. Link stow config:

   ```sh
   cd ~/.dotfiles
   stow -t ~ nvim
   stow -t ~ tmux
   stow -t ~ oh-my-zsh
   ```

   Note: use `--adopt` option of stow if any of the stowed files already exist.

1. Install tpm (tmux plugin manager)

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

   ```

1. Install tmux plugins:

   ```sh

   $ tmux
   <prefix> + I

   ```

1. Install nvm
1. Install ack

   ```sh

   brew install ack

   ```

1. Install fira mono code

   ```sh

   brew tap homebrew/cask-fonts
   brew install font-fira-code

   ```

## TODO

- Add manual steps to initial setup. Adapt for ubuntu
- Add way to externalize custom zsh startup since .zshrc get clobbered by
  ohmyzsh install. Something like:

1. Install ohmyzsh
2. echo "if [ -f ~/.dotfiles/.zshrc_custom.sh ] source ~/.dotfiles/.zshrc_custom.sh" >> ~/.zshrc
