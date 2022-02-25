#!/bin/sh

min=3400
max=4150

zerobasedindex=$(($1 - 1))

cat /sys/devices/system/cpu/cpu$zerobasedindex/cpufreq/scaling_cur_freq | awk "{printf \"%i\", ((\$1/1000)-$min)/($max-$min)*100}"
