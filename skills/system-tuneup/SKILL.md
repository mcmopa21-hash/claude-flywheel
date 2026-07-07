---
name: system-tuneup
description: Weekly system refinement ritual. Drains the improvement backlog into skill edits, new skills, loops, and routine drafts; audits memory, skills, and file organization; prunes what stopped earning its place. Run on your most capable model, ideally weekly.
---

# System Tuneup — Weekly Refinement & Organization Audit

You drain the improvement backlog into real changes and verify the whole system stays organized. This is capable-model work — if the session is on a fast/cheap model, say so and let the user decide whether to switch or proceed.

Five stages. Stages 1–3 are read-only. Nothing is written until the user approves the plan in Stage 3.

---

## STAGE 1 — DRAIN THE BACKLOG

Read the improvement backlog. For each **Open** item, classify it:
- **Apply now** — a skill edit, new skill scaffold, or local fix doable this session
- **Draft for approval** — anything creating a cloud routine (write the complete prompt text for sign-off first) or touching external systems
- **Blocked on the user** — account signups, UI-only actions, decisions; surface with the exact action needed
- **Drop** — no longer relevant; say why

Apply the **automation ladder** to every item and to repeated work noticed in recent memory:
1. Done manually 3+ times → make it a skill
2. Needed multiple times per day / requires monitoring → skill + `/loop`
3. Recurs on a calendar with no local dependencies → cloud routine via `/schedule`
4. Heavy parallel research → subagent fan-out step in the skill (capable model leads, cheap workers)

Assign a model to everything: skills and routines run on mid-tier models, monitors/polling on the cheapest. The capable model only refines; it doesn't run the repeated work.

---

## STAGE 2 — ORGANIZATION AUDIT

Run all checks. Report only exceptions.

**A. Memory integrity** — every memory file is indexed and every index line points to a real file; project memories >14 days old are stale candidates; duplicated or contradictory facts get merge proposals.

**B. Skills inventory** — every skill dir has a SKILL.md; backlog items or close-out notes that belong inside a skill but were never written in; skills whose instructions contradict newer feedback or CLAUDE.md rules.

**C. Usage-based pruning** — any skill or custom agent not invoked in ~30 days: propose archiving it (move aside, don't delete). An artifact that isn't used is pure carrying cost. Check invocation evidence in memory, backlog Applied entries, and each skill's Refinement Log.

**D. Routines & loops** — list known routines; verify each produced its expected artifact since the last tuneup (a routine that runs but produces nothing is a silent failure — flag it); surface any routine with pending prompt changes.

**E. File hygiene** — stray working files without a home; deliverables in the right place; scratch files cleaned up.

**F. CLAUDE.md fitness** — anything now wrong, superseded, or better moved elsewhere. CLAUDE.md loads every session; it should hold only universal, current rules.

**G. System map accuracy** — the system map matches reality: everything listed exists, everything existing is listed. Artifacts created since the last tuneup that never got their map line → add them now.

---

## STAGE 3 — PRESENT THE TUNEUP PLAN

```
**TUNEUP PLAN — [date]** (last tuneup: [date])

**APPLYING NOW:** → [skill/file] — [exact change, before/after for edits]
**DRAFTS FOR YOUR APPROVAL:** → [name] — [full prompt text / exact action]
**BLOCKED ON YOU:** → [item] — [exact action + link]
**PRUNING:** → [artifact] — [last used when; archive proposal]
**DROPPING:** → [item] — [why]
**ORGANIZATION FIXES:** → [file] — [move/merge/archive/update]
```

Ask: **"Good to apply? Tell me what to skip or change."** Do not write until the user responds.

---

## STAGE 4 — APPLY (ONLY AFTER APPROVAL)

0. **Back up before writing.** Copy every file the plan will edit (backlog, skills, CLAUDE.md, map) to a dated backup dir (e.g. `~/.claude/backups/flywheel/YYYY-MM-DD/`) first. If a write goes wrong, restore from there — never reconstruct from memory.
1. Make the approved skill edits and scaffolds; execute organization fixes and archives. **Archiving means moving aside** (e.g. `~/.claude/skills/_archive/`) — this system never deletes an artifact, only backlog housekeeping lines.
2. Create approved routines/loops (routine prompts only ever created with approved text — never improvised)
3. **Stamp each edited skill's Refinement Log** — a short section at the bottom of its SKILL.md: `- YYYY-MM-DD: [what changed and why, one line]`. This is how future models see the evolution and don't re-litigate past decisions. Create the section if missing.
4. Update the backlog: move applied items to **Applied** with today's date, delete Applied entries older than 30 days, remove dropped items, update the **Last tuneup** date in the header
5. Update the memory index and system map if anything was added, merged, or archived

---

## STAGE 5 — CLOSE-OUT

```
**Tuned up:**
- [file] — [what changed]

**Still open in backlog:** [count] items, oldest from [date]

**Watch for this week:** [1–2 things likely to generate friction worth logging]
```

---

## NOTES

- This skill maintains the system; it does not do project work. If a backlog item turns into real project work, note it as a next-session task instead of doing it here.
- If the backlog is empty and all audits pass, say so in three lines and stamp the date. A short tuneup is a healthy tuneup — don't invent work.
- If the same friction shows up 2+ weeks running, the fix is structural (skill rewrite, CLAUDE.md rule, or dropping the workflow) — escalate the proposal accordingly.
- **If the backlog is missing or corrupted, never proceed silently:** check the backup dir first, restore the newest copy, and tell the user what window of entries (if any) was lost. Only recreate from the template when no backup exists.

## Refinement Log
- (stamped by each tuneup that edits this file)
