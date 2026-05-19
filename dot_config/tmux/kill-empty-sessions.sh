# !/bin/bash

session=$(tmux display -p '#{session_name}')
window_count=$(tmux list-windows -t "$session" | wc -l)
pane_count=$(tmux list-panes -t "$session" | wc -l)
current_command=$(tmux display -p -t "$session" '#{pane_current_command}')
if [ "$window_count" -eq 1 ] && [ "$pane_count" -eq 1 ]; then
    if [ "$current_command" -eq "zsh" ]; then
        tmux kill-session -t "$session"
    fi
fi
