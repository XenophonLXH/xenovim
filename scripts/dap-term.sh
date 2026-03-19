#!/usr/bin/env bash
# Kill any existing debug window (from a previous session)
tmux kill-window -t work:debug 2>/dev/null

# Create a new debug window running the debuggee
tmux new-window -d -t work:6 -n debug "$@"

# Keep the window alive after the process exits so logs remain readable
tmux set-option -w -t work:debug remain-on-exit on
