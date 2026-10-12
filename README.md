# dev-workspace

Rebuilds my `~/code` layout on a new machine. No secrets, no `.env` files, no node_modules.

```
~/code/
  <repo>/                    one clone per project, on main (Claude Code integrates here)
  _worktrees/<repo>/         one worktree per active codex/<topic> or claude/<topic> branch
  _inbox/                    audit findings and handoff notes
```

1. `git clone https://github.com/jonncy18-maker/dev-workspace-public.git && cd dev-workspace-public && ./setup.sh`
2. `npm install` in each repo; recreate `.env.local` (AI-Capital-Planning, Personal-Dashboard) from the password manager.
3. Bring `~/.claude/CLAUDE.md` and `~/memory/` over separately (not stored in this public repo).
4. `claude` then `/login`; enable the Drive connector.

Branch rules, worktree commands and the integration steps: [BRANCHING.md](https://github.com/jonncy18-maker/Agentic-Loop/blob/main/BRANCHING.md) in Agentic-Loop. `code-meta/` holds the inbox README.
