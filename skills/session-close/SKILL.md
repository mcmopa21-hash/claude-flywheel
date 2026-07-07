---
name: session-close
description: End-of-session wrap-up. Reviews the full conversation, builds a complete save plan with diffs, presents it for approval, then saves to memory, skills, and the improvement backlog. Invoke at the end of any substantive work session.
---

# Session Close — Memory & Skill Sweep

You review the entire conversation and build a complete save plan. You present everything you intend to save or change before touching a single file. Nothing gets written until the user approves.

Five stages, in order.

---

## STAGE 1 — SCAN THE CONVERSATION

Read the full conversation from the top. Run five passes:

**Pass A — Memory candidates (4 types):**
- `user` — new facts about who the user is: role, preferences, knowledge level, constraints
- `feedback` — corrections to behavior ("stop doing X") AND soft confirmations of non-obvious choices accepted without pushback. Both matter: corrections are loud, confirmations are quiet — watch for both.
- `project` — current state of ongoing work: what's done, what's next, what's blocked, who owns what, deadlines. Convert relative dates to absolute dates.
- `reference` — pointers to external systems: doc URLs, spreadsheet names, tool IDs, repo links, trigger IDs

**Routing rule — where each candidate goes:**
- Universal working rule (applies regardless of project) → propose as an edit to CLAUDE.md, NOT a memory file
- Domain- or project-specific rule → memory file
- Craft correction that recurred within one skill's output → that skill's SKILL.md
A rule lands in only one place. CLAUDE.md loads every session; memory recall is selective — when in doubt about a universal rule, prefer CLAUDE.md.

**Pass B — Skill candidates:**
- Which skills were invoked this session?
- For each: did corrections recur across 2+ iterations? → the skill file needs updating.
- New examples, banned patterns, style rules, verified facts → add to the skill file.
- Exact words or phrasings the user provided explicitly → preserve verbatim in the skill file.
- Gaps that caused failure or improvisation → fill them.
- Cross-check the improvement backlog: were any Open items addressed this session (→ mark Applied)? Did friction occur that was never logged in-flight (→ add it)? Skill fixes identified here but NOT applied in this close go to the backlog's Open section, not just the carrying-forward list — the backlog is what `/system-tuneup` drains.

**Pass C — Soft confirmation scan:**
Explicitly scan for moments where the user accepted a non-obvious approach without correcting it: "ok" / "yes" / "this is better" after a judgment call, or moving on without pushing back. These are as worth saving as explicit corrections. Frame them as: "validated approach: [what was done] worked — [why it was non-obvious]."

**Pass D — Stale memory scan:**
Scan existing project and user memories for entries that may have aged out: passed deadlines, "next step" items now in the past, blockers that may have resolved, frequently-changing states. Flag as candidates to update or archive, not to delete without confirmation. Cross-check reality, not just dates: if a memory says something is "planned," verify whether it now exists and mark it done if so.

**Pass E — Workspace hygiene:**
Check for stray files this session left behind. Propose a home for each: deliverables to the user's working-files location, throwaway to delete. Never move or delete without listing it in the plan first.

**Open threads:** tasks deferred to "next time," things the user said they'd share or follow up on, work started but not finished.

---

## STAGE 2 — CHECK EXISTING FILES

Before building the preview:
1. Read the memory index to get the full picture
2. For each memory candidate: does a file already exist covering this? Still accurate → update in place. Contradicts → flag the conflict. Additive → append.
3. For each skill candidate: read the skill file and check whether the addition is already there. Only flag what's genuinely missing.

---

## STAGE 3 — BUILD AND PRESENT THE PREVIEW

Present the full save plan before writing anything:

```
**SESSION CLOSE PLAN — [date]**

**NEW MEMORIES:**
→ [filename].md (type) — [2–4 lines of what will be saved]

**MEMORY UPDATES:**
→ [filename].md — Before: […] / After: […]

**STALE FLAGS:**
→ [filename].md — [issue + proposed action]

**SKILL UPDATES:**
→ [skill]/SKILL.md — [section] + [lines being added]

**CLAUDE.MD UPDATES:** (universal rules only)
→ + [rule]

**BACKLOG UPDATES:**
→ [items marked Applied / new Open lines]

**FILE MOVES / CLEANUP:**
→ [path] → [destination or delete] — [why]

**CARRYING FORWARD:**
- [deferred task or open thread]
```

Then stop and ask: **"Good to save all of this? Say yes to write everything, or tell me what to skip or change."** Do not write anything until the user responds.

---

## STAGE 4 — WRITE (ONLY AFTER APPROVAL)

0. Before overwriting any existing memory or skill file, copy it to a dated backup dir (e.g. `~/.claude/backups/flywheel/YYYY-MM-DD/`). New files need no backup.
1. Write or update each memory file per the approved plan
2. **Persist every carrying-forward item into the relevant project memory** — the chat close-out dies with the terminal; `/session-start` can only surface open threads that live in files. If an open thread has no project memory, create one.
3. Update skill files, the backlog, and CLAUDE.md per the approved plan
4. Execute approved file moves/cleanup
5. Update the memory index last, after all files are written
6. If any artifact was created this session, confirm it has a line in the system map

If the user says "skip X" — adjust before writing. Don't write skipped items.

---

## STAGE 5 — CLOSE-OUT NOTE

```
**Saved:**
- [full file path] — [what it covers]

**Next session primer:**
[1–2 sentences: what to check or load at the start of the next relevant session.]
```

---

## WHAT NOT TO SAVE

- Code patterns, file structure, architecture — derivable from reading the code
- Git history or who changed what — `git log` / `git blame` are authoritative
- Debugging solutions — the fix is in the code; the commit has the context
- Anything already in CLAUDE.md
- Anything only relevant to this exact conversation and not future ones
- Step-by-step task lists for current work — those belong in task tracking, not memory

---

## EDGE CASES

**"I told you this before"** — if the user references something that should already be in memory but isn't, save it now and flag the structural gap.

**Recurring correction (3+ rewrites)** — the skill file is wrong. Fix the skill, not just memory.

**Skill cross-check** — if a rule is added to one skill, check whether it applies to any other active skill too.

**Partial approval** — if the user says "save everything except X," skip X, write the rest, and confirm what was skipped in the close-out note.
