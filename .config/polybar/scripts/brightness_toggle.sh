#! /bin/bash

brightFolder="/sys/class/backlight/intel_backlight/"
maxBright=`cat $brightFolder"max_brightness"`
currentBright=`cat $brightFolder"brightness"`

toggleThresholdPct=50
toggleUpPct=100
toggleDownPct=5

toggleThreshold=$(($maxBright * $toggleThresholdPct / 100))
toggleUpBright=$(($maxBright * $toggleUpPct / 100))
toggleDownBright=$(($maxBright * $toggleDownPct / 100))

if (($currentBright > $toggleThreshold))
then
  # toggle down
  newBright=$toggleDownBright
else
  # toggle up
  newBright=$toggleUpBright
fi

# write to file
echo $newBright | tee $brightFolder"brightness"

