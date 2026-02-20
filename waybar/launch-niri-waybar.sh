#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Stop existing bars first so restarts are clean.
pkill -x waybar 2>/dev/null || true

# Small delay to avoid race conditions during fast restarts.
sleep 0.2

waybar -c "$SCRIPT_DIR/top.jsonc" -s "$SCRIPT_DIR/top.css" >/tmp/waybar-top.log 2>&1 &
waybar -c "$SCRIPT_DIR/bottom.jsonc" -s "$SCRIPT_DIR/bottom.css" >/tmp/waybar-bottom.log 2>&1 &
waybar -c "$SCRIPT_DIR/left.jsonc" -s "$SCRIPT_DIR/left.css" >/tmp/waybar-left.log 2>&1 &
waybar -c "$SCRIPT_DIR/right.jsonc" -s "$SCRIPT_DIR/right.css" >/tmp/waybar-right.log 2>&1 &

echo "Waybar launched (top/bottom/left/right)."
echo "Logs: /tmp/waybar-top.log /tmp/waybar-bottom.log /tmp/waybar-left.log /tmp/waybar-right.log"
