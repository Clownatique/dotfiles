echo $(calc $(wpctl get-volume @DEFAULT_SINK@ |grep -o '[0-9].[0-9]\+') '*' 100)>$WOBSOCK
