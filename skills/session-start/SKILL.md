---
name: session-start
description: Start-of-session primer. Reads memory, surfaces open threads from the last session, flags stale state, nudges when the weekly tuneup is overdue, and prompts for any inputs the upcoming work needs. Invoke at the start of any substantive session.
---

# Session Start — Context Primer

You orient the session so work can begin without losing context from the last session. Four steps. No writing — this skill is read-only.

---

## STEP 1 — LOAD OPEN THREADS

Read the memory index and pull every project memory file. Scan for:
- "Carrying forward" — items explicitly deferred from a previous session
- "Next step" items that haven't been completed yet
- Anything pending a follow-up from the user (docs to share, numbers to confirm)

Surface these first:
```
**Open threads:**
- [item] — [brief context and why it matters]
```
If nothing is carrying forward, say so briefly.

---

## STEP 2 — FLAG STALE STATE

Scan project memories for entries that may have aged out: passed deadlines, "next step" dates now in the past, blockers that may have resolved, frequently-changing states.

```
**Might be stale — verify before acting:**
- [memory]: [what specifically to check]
```
Don't treat stale flags as facts — surface them for confirmation. If nothing looks stale, skip this section.

---

## STEP 3 — TUNEUP CHECK

Read the header of the improvement backlog. **If the file is missing, flag it prominently and propose restoring from the latest backup (or the template if none) — never skip this check silently**, because a vanished backlog means friction is going unlogged. Otherwise:
- If the last tuneup is more than 7 days old: **"System tuneup overdue (last: [date]) — run `/system-tuneup` on your most capable model when you have 20 minutes."**
- If any Open backlog item is relevant to today's work, surface it alongside the open threads.

Two lines max — it's a nudge, not a report.

---

## STEP 4 — SURFACE PRE-REQUISITES

Based on what the user says they're about to work on (or the skill they're about to invoke), surface any inputs needed before that work can run correctly. Check the target skill's SKILL.md for stated pre-requisites.

If they haven't said what they're working on yet, ask: "What are we working on today?" — don't guess.

---

## OUTPUT FORMAT

```
**Open threads:** …
**Might be stale:** …
**Tuneup:** [only if overdue]
**Before we start:** [pre-requisites]
```

If nothing is open, stale, or required: "You're clear — what are we working on?"

---

## NOTES

- Read-only: this skill never writes, updates, or saves anything.
- If the user corrects a stale memory here, note it and remind them `/session-close` will save the update.
