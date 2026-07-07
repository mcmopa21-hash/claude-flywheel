#!/bin/bash
# SessionStart hook: inject improvement-backlog status into every session's context.
# Set this to your backlog location:
BACKLOG="$HOME/.claude/BACKLOG.md"

[ -f "$BACKLOG" ] || exit 0

OPEN_COUNT=$(grep -c '^- \[ \]' "$BACKLOG" 2>/dev/null || echo 0)
LAST_TUNEUP=$(grep -o 'Last tuneup: [^*]*' "$BACKLOG" | head -1)

echo "[flywheel] Backlog: ${OPEN_COUNT} open item(s). ${LAST_TUNEUP}"

# Overdue check: compare a YYYY-MM-DD date in the header to 7 days ago (BSD + GNU date)
DATE_IN_HEADER=$(echo "$LAST_TUNEUP" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1)
if [ -n "$DATE_IN_HEADER" ]; then
  CUTOFF=$(date -v-7d +%Y-%m-%d 2>/dev/null || date -d '7 days ago' +%Y-%m-%d)
  if [[ "$DATE_IN_HEADER" < "$CUTOFF" ]]; then
    echo "[flywheel] Tuneup OVERDUE — suggest /system-tuneup on the most capable model."
  fi
fi
