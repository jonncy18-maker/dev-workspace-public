# Audit inbox

Audit findings go in an inbox folder: Codex writes to `~/code/_audits/`, Antigravity to `~/code/_antigravity/_audits/` (its workspace can't reach the shared folder). Both use this format. Claude reads them at session start, proposes fixes, and acts only after John approves. Files are deleted once every finding is fixed or declined.

## File name

`<Repo>__<auditor>__<YYYY-MM-DD-HHMM>.md`, one file per audit. `<Repo>` is the folder name in `~/code/` (e.g. `Personal-Dashboard`); `<auditor>` is `codex` or `antigravity`.

Example: `Personal-Dashboard__antigravity__2026-10-03-1830.md`

## Contents

```markdown
# Audit: <Repo> — <what was audited: branch, PR, folder or "whole repo">

Auditor: <codex | antigravity> · Commit: <short hash audited> · Date: <YYYY-MM-DD>

## Findings

### 1. <one-line title>
- **Severity:** critical | high | medium | low
- **Where:** `path/to/file.ext:line`
- **Issue:** what is wrong and how it fails, with the concrete case.
- **Suggested fix:** the smallest change that fixes it.

### 2. ...

## Checked and fine
<Areas reviewed with no findings, so the reader knows they were covered.>
```

Rules for auditors:
- Report findings only. Do not edit code to fix them.
- One finding per issue, most severe first. Say so when you are unsure.
- Write only inside your inbox folder.

## Handoff notes

Anyone who writes code on a branch (Codex on `codex/<topic>`, Antigravity on `antigravity/<topic>`) leaves one handoff note per branch in their inbox when they finish. It tells Claude what the branch is for and which parts to merge, so a mixed branch doesn't need to be untangled from the diff.

### File name

`<Repo>__<agent>__<YYYY-MM-DD-HHMM>-handoff.md` (e.g. `NextGen-Scholars__antigravity__2026-10-03-2100-handoff.md`).

### Contents

```markdown
# Handoff: <Repo> — <branch name>

Agent: <codex | antigravity> · Base: <short hash the branch started from> · Head: <short hash> · Date: <YYYY-MM-DD>

## Intent
One or two sentences: what the branch is for and what John asked for.

## Ships
Files or commits meant to be merged, one line each with what it does.

## Scaffolding (do not merge)
Anything temporary or only for local testing: mock data, offline fallbacks, debug code, seed files. Say "none" if there is none. Never put scaffolding in shared code paths; if the branch needs it, keep it in its own commits.

## Env assumptions
Env vars, flags or setup the branch only works with or without (e.g. "runs offline when DATABASE_URL is unset"). Say "none" if there are none.

## Not verified
What you did not build, run or test.
```

Rules:
- Describe the branch honestly. Do not mark something as Ships because it is finished; mark it because it is meant to go to the app.
- Do not touch auth, sessions, database access or API routes unless the task asked for it, and list any such change under Ships with a note on why.
- Claude deletes the note once the branch is merged or declined.
