#!/bin/sh
 
if pgrep wf-recorder; then
    pkill wf-recorder
else;
    wf-recorder -f ~/Videos/$(date +'%Y%m%d_%H%M%S').mkv -p color_range=3 -r 60 &
fi;
