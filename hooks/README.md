# Optional: harness-enforced nudges via hooks

Everything else in this repo relies on the model *choosing* to follow rules in CLAUDE.md. Hooks are the next level: the Claude Code harness itself runs a script on session start and injects its output into context — the backlog status arrives every session **mechanically**, whether or not any skill is invoked.

## Install

1. Copy `backlog_status.sh` somewhere stable (e.g. `~/.claude/hooks/backlog_status.sh`), make it executable (`chmod +x`), and set `BACKLOG` inside it to your backlog path.
2. Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          { "type": "command", "command": "~/.claude/hooks/backlog_status.sh" }
        ]
      }
    ]
  }
}
```

Now every session opens already knowing: open backlog item count, last tuneup date, and whether the tuneup is overdue — zero reliance on the model remembering to check.

## Why this matters

The flywheel's weakest link is any step that depends on model discipline. Each rule you can move from "instructions the model follows" to "behavior the harness enforces" removes a failure mode. Start with this one; add others (e.g. a `Stop` hook reminding about `/session-close` when memory-worthy work happened) only after you feel a real gap — hooks are also artifacts, and the playbook's no-by-default rule applies to them too.
