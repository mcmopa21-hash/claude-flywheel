# Paste this block into your CLAUDE.md

Replace the two placeholders first:
- `{{BACKLOG_PATH}}` → where you put the backlog (e.g. `~/.claude/BACKLOG.md`)
- `{{PLAYBOOK_PATH}}` → where you put the playbook (e.g. `~/.claude/ARTIFACT_PLAYBOOK.md`)

---

## Continuous improvement flywheel
- **Capture friction in-flight.** The moment a skill/routine/loop misfires, the same correction is given a second time, or a task is done manually for the 3rd time: append one dated line to the backlog (`{{BACKLOG_PATH}}`, Open section) right then — don't wait for session close. Flag it in one short line, then continue the task.
- **Recommend the artifact before doing the work.** When asked to run through, set up, or repeat any kind of work: consult `{{PLAYBOOK_PATH}}` and recommend the fitting artifact (skill / subagent / loop / routine / repo) in 1–2 lines, then proceed — recommending never blocks doing. The playbook's default is NO artifact; when none is warranted, skip the recommendation silently. Build only on explicit go-ahead; declined candidates go to the backlog.
- **Automation ladder:** 3rd manual repetition → skill. Needed multiple times a day or requires monitoring → skill + `/loop`. Calendar recurrence with no local dependencies → cloud scheduled routine (draft the full prompt for approval before creating). Heavy parallel research inside a skill → subagent fan-out (capable model leads, cheap model workers).
- **Weekly `/system-tuneup`** on the most capable available model drains the backlog into skill edits and new artifacts. `/session-start` nudges when it's >7 days overdue.
- **Can't find something? Read `~/.claude/SYSTEM_MAP.md`** — the router to every skill, memory location, routine, and file convention. Creating a new artifact = add its line to the map in the same session.

## Session rhythm
- Start substantive sessions with `/session-start` (read-only primer). End them with `/session-close` (previews its save plan for approval before writing anything).
