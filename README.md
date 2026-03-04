# Managed with chezmoi
.

This repo defines my shell, Neovim, WezTerm and related configuration.
Chezmoi keeps the source in a separate directory and applies it to $HOME.

## 🚀 Quick Install
### macOS
brew install chezmoi
chezmoi init --apply <YOUR_REPO_URL>

### Linux / WSL
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
chezmoi init --apply <YOUR_REPO_URL>

That’s it.

## 🔁 Updating
### After pulling changes on any machine:

chezmoi pull
chezmoi apply

## ✏️ Editing Config

### Edit via chezmoi:

chezmoi edit ~/.zshrc
chezmoi apply

If a tool updates a managed file (e.g. LazyVim lockfile):

chezmoi add ~/.config/nvim/lazy-lock.json
chezmoi git commit -m "Update plugins"
chezmoi git push

## 🧠 Structure

dot_* → files in $HOME

dot_config/ → ~/.config/

Source lives in ~/.local/share/chezmoi

$HOME is the rendered target
