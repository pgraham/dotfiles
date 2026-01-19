# dotfiles

1. Create SSH credentials and upload to Github

   ```sh
   ssh-keygen -t ed25519
   ```
   
2. Clone repo and run setup

   ```sh
   git clone git@github.com:pgraham/dotfiles.git
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
1. Install zsh-syntax-highlighting, zsh-autosuggestions (via homebrew):

   ```sh
   $ brew install zsh-syntax-highlighting
   $ brew install zsh-autosuggestions
   ```
   
1. Install neovim

   ```sh
   # Macos
   $ brew install neovim # or
   $ brew install --HEAD neovim # for dev version

   # Ubuntu
   # TODO Update instructions for installing from source
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
1. Install ripgrep, and fd

   ```sh
   brew install ripgrep
   brew install fd
   ```

1. Install fira mono code: https://github.com/tonsky/FiraCode/wiki/Installing

## TODO

- Add manual steps to initial setup. Adapt for ubuntu
- Add way to externalize custom zsh startup since .zshrc get clobbered by
  ohmyzsh install. Something like:

1. Install ohmyzsh
2. echo "if [ -f ~/.dotfiles/.zshrc_custom.sh ] source ~/.dotfiles/.zshrc_custom.sh" >> ~/.zshrc
