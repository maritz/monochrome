#!/bin/sh

min=3400
max=4150

zerobasedindex=$(($1 - 1))

rawFreq=$(cat /sys/devices/system/cpu/cpu$zerobasedindex/cpufreq/scaling_cur_freq)

freq=$(echo "$rawFreq" | awk "{printf \"%i\", ((\$1/1000)-$min)/($max-$min)*100}")

if [ $freq -lt 0 ]; then
  freq=0
fi

if [ $freq -gt 100 ]; then
  freq=100
fi

echo "$freq"
