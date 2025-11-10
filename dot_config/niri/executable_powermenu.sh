#!/bin/bash
set -e

DISPLAY_NAMES=(Lock Quit 'Power Off' Reboot Suspend)
COMMANDS=('swaylock' 'niri msg action quit' 'systemctl poweroff' 'systemctl reboot' 'systemctl suspend')

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi -H 200 -W 200 --dmenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:text:}"

# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    eval "${COMMANDS[i]}"
    break
  fi
done

