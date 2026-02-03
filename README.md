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
1. Install homebrew

### Ubuntu

1. Install zsh

   [Oh-my-zsh zsh install instructions](nvim/.config/nvim/plugin/packer_compiled.lua)

   ```sh
   sudo apt install zsh
   chsh -s $(which zsh)
   ```

### Common

1. Install oh-my-zsh
1. Install zsh-syntax-highlighting, zsh-autosuggestions (via homebrew):

   ```sh
   # zsh-autosuggestions
   $ cd ~/.zsh
   $ git clone https://github.com/zsh-users/zsh-autosuggestions
   $ echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

   # zsh-syntax-highlighting -- must be at the end of .zshrc
   $ mkdir ~/.zsh
   $ cd ~/.zsh
   $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
   $ echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
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

1. Install tmux (Macos Only, is installed by default with Ubuntu)

   ```sh
   brew install tmux
   ```

1. Install stow

   ```sh
   # Macos
   brew install stow

   # Ubuntu
   sudo apt install stow
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

1. Install nvm and latest LTS Node version with global packages.

   [NVM install](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
   
   ```sh
   $ nvm install --lts
   ```

   Then, install global packages
   ```sh
   $ npm i -g @fsouza/prettierd pm2 @vtsls/language-server
   ```
   
1. Install ripgrep, and fd

   ```sh
   # Macos
   brew install ripgrep
   brew install fd

   # Ubuntu
   sudo apt install ripgrep
   sudo apt install fd-find
   mkdir -p ~/.local/bin
   ln -s $(which fdfind) ~/.local/bin/fd
   ```

1. Install fira mono code: https://github.com/tonsky/FiraCode/wiki/Installing
   This should only be necessary on Macos because iTerm will apply the font.

## TODO

- Add manual steps to initial setup. Adapt for ubuntu
- Add way to externalize custom zsh startup since .zshrc get clobbered by
  ohmyzsh install. Something like:

1. Install ohmyzsh
2. echo "if [ -f ~/.dotfiles/.zshrc_custom.sh ] source ~/.dotfiles/.zshrc_custom.sh" >> ~/.zshrc
