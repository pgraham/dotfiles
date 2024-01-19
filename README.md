# dotfiles

```
bash -c "$(curl -fsSL https://raw.github.com/pgraham/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

## Manual

### MacOS

1. Install iTerm2

### Ubuntu

1. Install zsh

   [Oh-my-zsh zsh install instructions](nvim/.config/nvim/plugin/packer_compiled.lua)

   ```
   sudo apt install zsh
   chsh -s $(which zsh)
   ```

### Common

1. Install homebrew
1. Install oh-my-zsh
1. Install zsh-syntax-highlighting, zsh-autosuggestions (via homebrew)
1. Install neovim (via homebrew)

   ```
   # Macos
   $ brew install neovim # or
   $ brea install --HEAD neovim # for dev version

   # Ubuntu
   $ sudo add-apt-repository ppa:neovim-ppa/unstable
   $ sudo apt update
   $ sudo apt install neovim
   ```

1. Install tmux

```
brew install tmux
```

1. Install stow

   ```
   brew install stow
   ```

1. Link stow config:

   ```
   cd ~/.dotfiles
   stow -t ~ nvim
   stow -t ~ tmux
   stow -t ~ oh-my-zsh
   ```

   Note: use `--adopt` option of stow if any of the stowed files already exist.

1. Install tpm (tmux plugin manager)

```

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

```

Install tmux plugins:

```

$ tmux
<prefix> + I

```

1. Install nvm
1. Install ack

```

brew install ack

```

1. Install fira mono code

```

brew tap homebrew/cask-fonts
brew install font-fira-code

```

## TODO

- Add manual steps to initial setup. Adapt for ubuntu
- Add way to externalize custom zsh startup since .zshrc get clobbered by
  ohmyzsh install. Something like:

1. Install ohmyzsh
2. echo "if [ -f ~/.zshrc_custom.sh ] source ~/.zshrc_custom.sh" >> ~/.zshrc
3. Add .zshrc_custom.sh to link files

## Notes

### oh-my-zsh

- Put config specific to local directly in ~/.zshrc

```

```
