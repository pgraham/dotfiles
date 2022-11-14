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

2. Install oh-my-zsh
3. Install nvm
4. Install homebrew
5. Install zsh-syntax-highlighting, zsh-autosuggestions (via homebrew)
6. Install neovim (via homebrew)
   ```
   brew install neovim
   ```
7. Install stow
   ```
   brew install stow
   ```
8. Install ack
   ```
   brew install ack
   ```
9. Install fira mono code
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
