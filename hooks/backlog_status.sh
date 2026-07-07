#!/bin/bash
# SessionStart hook: inject improvement-backlog status into every session's context.
# Failsafe by design: never blocks a session — always exits 0, warns instead of erroring.
# Set this to your backlog location:
BACKLOG="$HOME/.claude/BACKLOG.md"

if [ ! -f "$BACKLOG" ]; then
  echo "[flywheel] WARNING: backlog not found at $BACKLOG — restore it from backup or templates/BACKLOG.md before friction goes unlogged."
  exit 0
fi

# grep -c prints the count even when it exits nonzero (no matches) — capture, don't ||
OPEN_COUNT=$(grep -c '^- \[ \]' "$BACKLOG" 2>/dev/null)
OPEN_COUNT=${OPEN_COUNT:-0}
LAST_TUNEUP=$(grep -o 'Last tuneup: [^*]*' "$BACKLOG" 2>/dev/null | head -1)

echo "[flywheel] Backlog: ${OPEN_COUNT} open item(s). ${LAST_TUNEUP:-Last tuneup: unknown (header not found)}"

if echo "$LAST_TUNEUP" | grep -qi 'never'; then
  echo "[flywheel] Tuneup has never run — suggest /system-tuneup on the most capable model."
else
  DATE_IN_HEADER=$(echo "$LAST_TUNEUP" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1)
  if [ -n "$DATE_IN_HEADER" ]; then
    # BSD (macOS) date first, GNU date fallback; ISO dates compare correctly as strings
    CUTOFF=$(date -v-7d +%Y-%m-%d 2>/dev/null || date -d '7 days ago' +%Y-%m-%d)
    if [[ "$DATE_IN_HEADER" < "$CUTOFF" ]]; then
      echo "[flywheel] Tuneup OVERDUE (last: $DATE_IN_HEADER) — suggest /system-tuneup on the most capable model."
    fi
  fi
fi

exit 0
