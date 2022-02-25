#!/bin/sh

#arg 1 = expected minimum aka. lower boundary of graph range
#arg 2 = expected maximum aka. upper boundary of graph range

temp=$(sensors k10temp-pci-00c3 | awk "/Tdie/ {printf \"%i\", (\$2-$1)/($2-$1)*100}")

if [ $temp -lt 0 ]; then
  temp=0
fi

if [ $temp -gt 100 ]; then
  temp=100
  espeak "Warning: CPU Temperature too high"
  espeak "Warning: CPU Temperature too high"
  espeak "Warning: CPU Temperature too high"
fi

echo "$temp"
