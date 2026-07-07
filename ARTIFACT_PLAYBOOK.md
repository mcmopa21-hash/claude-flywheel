# Artifact Playbook

**Trigger:** whenever the user asks to run through, set up, or repeat some kind of work, consult this guide BEFORE doing the work manually. Recommend the fitting artifact in 1–2 lines, then proceed with the work — recommending never blocks doing. Build the artifact only on explicit go-ahead.

**Recommendation format:** "This is a [artifact] candidate because [signal]. Want it built after this run?" If declined or unanswered, log the candidate to the backlog and move on.

## Which artifact

| Signal in the request | Artifact | Lives at |
|---|---|---|
| One-off, unlikely to repeat | None — just do it. 2nd occurrence → log to backlog | — |
| Repeatable procedure with steps/judgment (3rd rep, or obviously recurring) | **Skill** (SKILL.md + helper scripts in one folder) | `~/.claude/skills/<name>/` |
| Research across many similar targets | **Subagent fan-out** — built-in agents first ("use subagents", cheap-model workers) | Nothing stored |
| A fan-out pattern used 3+ times needing a fixed model/tools/prompt | **Custom agent** (markdown definition) | `~/.claude/agents/<name>.md` |
| Same-day waiting/polling (a run finishing, a file appearing, a reply landing) | **`/loop`** — ephemeral, never a stored artifact | Nothing stored |
| Calendar recurrence, zero local dependencies (no local venvs/files) | **Cloud routine** via `/schedule` — draft the FULL prompt for approval before creating | Cloud routines UI |
| Code a cloud routine or another machine must reach, or tooling worth versioning/sharing | **GitHub repo** — propose, push only on explicit go | GitHub |
| A fact, preference, or project state to persist | **Memory file** (+ index line) | memory directory |
| A rule that applies to every session regardless of project | **CLAUDE.md edit** — keep it to 1–3 lines | `~/.claude/CLAUDE.md` |
| A deliverable document for the user | Plain file | wherever the user keeps working files |
| Throwaway/intermediate work | Scratch file | session scratchpad only |

**Model assignment when creating:** the artifact *runs* on fast/inexpensive models (skills, routines on a mid-tier model; monitors and fan-out workers on the cheapest); only its *refinement* belongs on the most capable model. Write the model into routine configs and custom-agent frontmatter explicitly.

## When NOT to save an artifact — the default is NO

Every artifact has a carrying cost: context it loads, staleness it accumulates, garbage-collection the weekly tuneup must do. The work has to *earn* its artifact. Do not create one when:

- **It happened once.** No evidence of recurrence = no artifact. 2nd occurrence costs one backlog line, nothing more. The ladder starts at the 3rd rep.
- **The knowledge is derivable at need.** If the "procedure" is just "search / read the doc / call the API and look," a skill wrapping it adds maintenance without adding capability.
- **The process hasn't stabilized.** If this run's steps differ from last run's, capturing it now bakes in wrong steps. Wait until a procedure survives two runs unchanged, then save it.
- **Each instance is genuinely different judgment** (pricing calls, negotiation, sensitive communications). A step-by-step skill gives false confidence there; the right save is a short principles note in memory, not a procedure.
- **Redoing it manually is cheaper than maintaining it.** A 2-minute task done monthly never pays back a skill.
- **It's exploratory.** "Let's figure out X" isn't a procedure yet — explore first; only if a repeatable shape emerges does it become a candidate.
- **It's an output, not a process.** Deliverables are results, never artifacts.
- **Something existing already covers 80%.** Extend the existing skill/agent/memory; check `~/.claude/skills/` and `~/.claude/agents/` before scaffolding anything.

**When the answer is "none," say nothing** — just do the work. Announcing "no artifact needed" every time is noise. When genuinely unsure, the tiebreak is one backlog line, not an artifact: recurrence will prove itself or it won't.

## Storage rules

- **Local only, always:** everything under `~/.claude/` (skills, agents, memory, CLAUDE.md). These hold working context and often credentials. Never push them anywhere.
- **GitHub, when:** (1) a cloud routine needs the code — cloud agents can't reach your laptop; (2) it's worth versioning or sharing. Before any push: strip credentials, client data, and personal context. Pushing is an explicit-approval action every time.
- **Skills that need code in the cloud** get split: skill instructions + logs stay local, sanitized code goes in the repo.

## Other anti-patterns

- Don't create a cloud routine with an improvised prompt — on some platforms prompts lock at creation. Draft, get approval, then create.
- A recommendation is one or two lines. Don't turn it into a design discussion unless the user engages.
