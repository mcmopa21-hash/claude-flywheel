# claude-flywheel

A self-improving system for Claude Code. It gives any Claude session — on any model — the judgment to know **when to turn work into a reusable artifact** (skill, subagent, loop, scheduled routine, repo) and **when not to**, plus the rituals that make those artifacts continuously refine themselves as you work.

No personal data, no credentials, no project references. Drop it into any machine.

## What's inside

```
CLAUDE_MD_SNIPPET.md          → rules to paste into your CLAUDE.md (the engine)
ARTIFACT_PLAYBOOK.md          → decision guide: which artifact, when, where it lives, when NONE
skills/
  session-start/SKILL.md      → start-of-session primer (open threads, stale state, tuneup nudge)
  session-close/SKILL.md      → end-of-session wrap-up (sweeps the conversation into memory + skills)
  system-tuneup/SKILL.md      → weekly refinement ritual (drains the backlog, audits organization)
templates/
  BACKLOG.md                  → the improvement backlog file the whole system feeds
  SYSTEM_MAP.md               → a "find anything" router you fill in as your system grows
hooks/
  backlog_status.sh + README  → optional: harness-enforced backlog nudge on every session start
```

## How the flywheel works

1. **In-flight capture** — the moment a skill misfires, you correct the same thing twice, or a task is done manually a third time, Claude appends one dated line to the backlog. No end-of-session archaeology.
2. **Session close** — `/session-close` sweeps the conversation: recurring corrections go into the relevant skill file, project state goes into memory, unresolved candidates go to the backlog.
3. **Weekly tuneup** — `/system-tuneup` drains the backlog into real changes (skill edits, new skills, loop/routine proposals) and audits that everything stays organized.
4. **Artifact judgment** — every "run through this work" request gets checked against the playbook. Default answer: **no artifact**. Work has to earn its automation by recurring.

## Install (5 minutes)

1. Copy the three skill folders into `~/.claude/skills/` (or a project's `.claude/skills/` to keep it repo-scoped).
2. Create your backlog: copy `templates/BACKLOG.md` somewhere stable (e.g. `~/.claude/BACKLOG.md`) .
3. Copy `templates/SYSTEM_MAP.md` to `~/.claude/SYSTEM_MAP.md` and fill in what your setup already has.
4. Open `CLAUDE_MD_SNIPPET.md`, replace the `{{BACKLOG_PATH}}` / `{{PLAYBOOK_PATH}}` placeholders, and paste the block into `~/.claude/CLAUDE.md` (create the file if it doesn't exist). Put `ARTIFACT_PLAYBOOK.md` wherever the path you chose points.
5. Start your next session with `/session-start`. End it with `/session-close`. Run `/system-tuneup` weekly on your most capable model.

## Design principles

- **CLAUDE.md is the only guaranteed load** — every session, every model reads it. Rules that must always apply live there (kept to a few lines); detail lives in files it points to by exact path.
- **The default is no artifact.** Premature skills become stale clutter. One backlog line is the cheap bet; recurrence proves itself or it doesn't.
- **Cheap models run, capable models refine.** Skills and routines execute on fast/inexpensive models; the weekly tuneup — where judgment compounds — runs on your strongest one.
- **Everything auditable.** The backlog's Applied section is a dated trail of how the system evolved; the tuneup garbage-collects what stopped earning its place.
