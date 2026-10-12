#!/usr/bin/env bash
# Rebuild John's ~/code layout on a new machine. Safe to re-run.
set -euo pipefail
OWNER=jonncy18-maker
REPOS="AI-Capital-Planning AI-harness Agentic-Loop Anti-gravity-Test NextGen-Immersion NextGen-Scholars Personal-Dashboard"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/code/_claude ~/code/_codex ~/code/_antigravity ~/code/_audits ~/code/_antigravity/_audits ~/code/_sandbox
for r in $REPOS; do
  [ -d ~/code/$r/.git ] || git clone "https://github.com/$OWNER/$r.git" ~/code/$r
done
# Agent copies (Codex / Antigravity) use the same repos minus Agentic-Loop and Anti-gravity-Test.
for r in AI-Capital-Planning AI-harness NextGen-Immersion NextGen-Scholars Personal-Dashboard; do
  for a in _codex _antigravity; do
    [ -d ~/code/$a/$r/.git ] || git clone "https://github.com/$OWNER/$r.git" ~/code/$a/$r
    git -C ~/code/$a/$r remote get-url local >/dev/null 2>&1 || git -C ~/code/$a/$r remote add local ~/code/$r
    git -C ~/code/$a/$r remote set-url --push local DISABLED
    git -C ~/code/$a/$r remote set-url --push origin DISABLED
  done
done
cp -n "$HERE/code-meta/audits-README.md" ~/code/_audits/README.md
# Commits that were never on GitHub (local branches), restored as bundle/<name>.
for b in "$HERE"/unpushed/*.bundle; do
  r="$(basename "$b" .bundle)"
  git -C ~/code/$r fetch "$b" 'refs/heads/*:refs/heads/*' || true
done
echo "Done. Next: npm install in each repo; recreate .env.local files from your password manager;"
echo "copy ~/.claude/CLAUDE.md and ~/memory/ (see README) and run /login in Claude Code."
