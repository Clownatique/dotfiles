#!/bin/sh
START_SECS=$1
END_SECS=$(date +%s)
DIFF_SECS=$(($END_SECS - $START_SECS))
SECS=$(($DIFF_SECS % 60))
MINS=$(($DIFF_SECS / 60 % 60))
HOURS=$((DIFF_SECS / 3600 % 24))
echo "$([ "$HOURS" -ne 0 ] && printf '%sh' "$HOURS")${MINS}m ${SECS}s"
