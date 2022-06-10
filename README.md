# dotfiles

```
bash -c "$(curl -fsSL https://raw.github.com/pgraham/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

## Manual

1. Install iTerm2 # Macos only
1. Install oh-my-zsh
2. Install nvm
3. Install homebrew
4. Install zsh-syntax-highlighting, zsh-autosuggestions (via homebrew)
4. Install vim (via homebrew)
   ```
   brew install vim
   ```
5. Install ack
   ```
   brew install ack
   ```
5. Install fira mono code
   ```
   brew tap homebrew/cask-fonts
   brew install font-fira-code
   ```

## TODO

- Add manual steps to initial setup.
- Add way to externalize custom zsh startup since .zshrc get clobbered by
  ohmyzsh install. Something like:
  1. Install ohmyzsh
  2. echo "if [ -f ~/.zshrc_custom.sh ] source ~/.zshrc_custom.sh" >> ~/.zshrc
  3. Add .zshrc_custom.sh to link files
