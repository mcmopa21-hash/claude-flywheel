# SYSTEM MAP — Find Anything

The single router for this machine's Claude system. If you're looking for something and it's not obvious where it lives, start here. Maintained by `/system-tuneup` (weekly audit); anyone creating a new artifact adds its line here in the same session.

## Routing table

| You need… | Go to |
|---|---|
| Universal behavior rules (every session, every model) | `~/.claude/CLAUDE.md` |
| Which artifact to create for a piece of work (or none) | (path to ARTIFACT_PLAYBOOK.md) |
| Pending improvements / friction log | (path to BACKLOG.md) |
| A repeatable procedure | `~/.claude/skills/<name>/SKILL.md` — inventory below |
| Custom subagent definitions | `~/.claude/agents/` |
| Cloud routines (scheduled agents) | (list each routine + its management URL) |
| Code shared with the cloud / other machines | (list repos) |
| Credentials, IDs, API patterns | (pointer to where they live — never store values here; never fabricate: if absent, say so) |
| Deliverables for the user | (working-files location) |
| Temp/intermediate files | session scratchpad only |

## Skills inventory (`~/.claude/skills/`)

| Skill | Invoke when | Notes |
|---|---|---|
| `session-start` | Start of any substantive session | Read-only primer |
| `session-close` | End of any substantive session | Previews save plan before writing |
| `system-tuneup` | Weekly, or when session-start nags | Most capable model; drains backlog, audits this map |
| (add each skill as it's created) | | |

## The improvement cycle

1. **In-flight:** friction/candidates → one line in the backlog, the moment they happen
2. **Session end:** `/session-close` sweeps conversation → memory/skill updates + backlog cross-check
3. **Weekly:** `/system-tuneup` drains backlog → skill edits, new artifacts, pruning, organization audit
4. **Artifact decisions:** always via the playbook — default is NO artifact

## Warnings that save time

- (accumulate machine-specific gotchas here — silent API failures, alias traps, platform quirks)
