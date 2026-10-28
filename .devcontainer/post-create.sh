#!/usr/bin/env bash

set -Eeuo pipefail

bundle install

if [ -f package.json ]; then
  if [ -f package-lock.json ]; then
    npm ci
  else
    npm install
  fi
  npm run build
fi

# Install dependencies for shfmt extension
if ! command -v shfmt &>/dev/null; then
  curl -fsSL https://webi.sh/shfmt | sh
fi

# Add OMZ plugins
plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
mkdir -p "$plugins_dir"

if [ ! -d "$plugins_dir/zsh-syntax-highlighting" ]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$plugins_dir/zsh-syntax-highlighting"
fi

if [ ! -d "$plugins_dir/zsh-autosuggestions" ]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions \
    "$plugins_dir/zsh-autosuggestions"
fi

if [ -f "$HOME/.zshrc" ] &&
  ! grep -q 'zsh-syntax-highlighting' "$HOME/.zshrc"; then
  sed -i -E \
    "s/^(plugins=\()(git)(\))/\1\2 zsh-syntax-highlighting zsh-autosuggestions\3/" \
    "$HOME/.zshrc"
fi

# Avoid git log use less
if [ -f "$HOME/.zshrc" ] && ! grep -q '^unset LESS$' "$HOME/.zshrc"; then
  printf '\nunset LESS\n' >>"$HOME/.zshrc"
fi
