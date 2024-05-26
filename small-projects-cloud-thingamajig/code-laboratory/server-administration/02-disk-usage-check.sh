# --------------------------------------------------------- #
#
# -- Shell -- Disk Usage -- Check Automation -- 
#
# --------------------------------------------------------- #

#!/bin/bash
THRESHOLD=80

# Check disk usage and print warning if usage is above threshold
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '( print $5 " " $1 }' | 
while read output;
do
  usage=$(echo $output | awk '(print $1)' | cut -d'%' -f1)
  partition=$(echo $output | awk '( print $2 )')
  