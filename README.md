# dev-workspace

Rebuilds my `~/code` layout on a new machine. No secrets, no `.env` files, no node_modules.

1. `git clone https://github.com/jonncy18-maker/dev-workspace.git && cd dev-workspace && ./setup.sh`
2. `npm install` in each repo; recreate `.env.local` (AI-Capital-Planning, Personal-Dashboard) from the password manager.
3. Bring `~/.claude/CLAUDE.md` and `~/memory/` over separately (not stored in this public repo).
4. `claude` then `/login`; enable the Drive connector.

`unpushed/` holds a git bundle of local-only branches (AI-Capital-Planning: dashboard-redesign, backup-main-before-sync, codex/wealth-trajectory-design); `setup.sh` fetches them into the cloned repo. `code-meta/` holds the audit-inbox README.
