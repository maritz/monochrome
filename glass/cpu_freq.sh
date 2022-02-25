#!/bin/sh

zerobasedindex=$(($1 - 1))

cat /sys/devices/system/cpu/cpu$zerobasedindex/cpufreq/scaling_cur_freq | awk "{printf \"%i\", \$1/1000}"
