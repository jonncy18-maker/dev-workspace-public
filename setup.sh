#!/usr/bin/env bash
# Rebuild John's ~/code layout on a new machine. Safe to re-run.
#   ~/code/<repo>              one clone per project, kept on main
#   ~/code/_worktrees/<repo>/  one git worktree per active agent branch
#   ~/code/_inbox/             audit findings and handoff notes
set -euo pipefail
OWNER=jonncy18-maker
REPOS="AI-Capital-Planning AI-harness Agentic-Loop NextGen-Immersion NextGen-Scholars Personal-Dashboard"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/code/_worktrees ~/code/_inbox
for r in $REPOS; do
  [ -d ~/code/$r/.git ] || git clone "https://github.com/$OWNER/$r.git" ~/code/$r
  mkdir -p ~/code/_worktrees/$r
done
cp -n "$HERE/code-meta/inbox-README.md" ~/code/_inbox/README.md
echo "Optional shell tools + dotfiles: ./dotfiles/install-shell-tools.sh"
echo "Done. Next: npm install in each repo; recreate .env.local files from your password manager;"
echo "copy ~/.claude/CLAUDE.md and ~/memory/ (see README) and run /login in Claude Code."
echo "New agent branch: git -C ~/code/<repo> worktree add ../_worktrees/<repo>/<agent>-<topic> -b <agent>/<topic> main"
