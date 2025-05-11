#!/bin/bash

gdctl_show=$(gdctl show)
logical_monitor_count=$(echo "$gdctl_show" | grep -Po 'Logical monitor #\N' | wc -l)
primary_monitor=$(echo "$gdctl_show" | grep -Po '\SDP-1' | wc -l)

if [ $logical_monitor_count -gt 1 ]; then
  gdctl set \
  --logical-monitor \
  --primary \
  --monitor DP-1
elif [ $primary_monitor -eq 1 ]; then
  gdctl set \
  --logical-monitor \
  --primary \
  --monitor HDMI-1 \
  --mode 3840x2160@119.880 \
  --color-mode bt2100
else
  gdctl set \
  --logical-monitor \
  --monitor HDMI-1 \
  --mode 3840x2160@119.880 \
  --color-mode bt2100 \
  --logical-monitor \
  --primary \
  --monitor DP-1 \
  --right-of HDMI-1
fi
