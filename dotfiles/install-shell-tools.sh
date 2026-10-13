#!/usr/bin/env bash
# Installs the shell tools and links the dotfiles. Safe to re-run. Asks for your password once (sudo).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
sudo apt install -y starship fzf zoxide bat eza stow

# Back up existing files so stow doesn't collide with them
for f in ~/.bash_aliases ~/.config/starship.toml; do
  if [ -e "$f" ] && [ ! -L "$f" ]; then mv "$f" "$f.backup-$(date +%Y%m%d)"; fi
done
cd "$HERE" && stow -t ~ bash starship scripts systemd
systemctl --user daemon-reload
systemctl --user enable --now repo-check.timer
echo "Done. Open a new terminal tab to see the new prompt."
