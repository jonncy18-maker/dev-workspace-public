#!/usr/bin/env bash
# Restores keyboard shortcuts (Super+Enter terminal, Super+N Chrome, Super+[ / ] desks). Safe to re-run.
dconf load / < "$(cd "$(dirname "$0")" && pwd)/shortcuts.dconf"
echo "Shortcuts restored."
