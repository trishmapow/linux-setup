#!/usr/bin/env bash

# Script for xfce4-panel genmon, display battery capacity and power usage
awk '{printf "%s", $1"% "}' < /sys/class/power_supply/BAT0/capacity
awk '{$1 = $1 / 1000000; printf "%.1f W", $1}' < /sys/class/power_supply/BAT0/power_now
