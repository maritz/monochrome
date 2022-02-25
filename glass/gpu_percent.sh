#!/bin/sh

if [[ -z $3 ]]; then
  nvidia-smi --query-gpu=$1 --format=csv,noheader,nounits | awk "{printf \"%i\", \$1/$2*100}"
else
  # minimum passed
  nvidia-smi --query-gpu=$1 --format=csv,noheader,nounits | awk "{printf \"%i\", (\$1-$3)/($2-$3)*100}"
fi
