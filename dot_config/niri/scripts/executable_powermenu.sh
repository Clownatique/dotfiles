#!/usr/bin/env bash
set -e

DISPLAY_NAMES=('󰏤 Suspend' ' Reboot to UEFI' '󰜉 Reboot' '󰈆 Quit' '󰐥 Power Off'  )
COMMANDS=('systemctl suspend'  'systemctl reboot'   'systemctl reboot --firmware-setup'   'niri msg action quit' 'systemctl poweroff')

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | fuzzel --hide-prompt --minimal-lines --dmenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:text:}"

# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    eval "${COMMANDS[i]}"
    break
  fi
done

