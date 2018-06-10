#!/bin/bash

DSTAMP=`date +%Y-%m-%d-%H-%M-%S`
BUILD_OUTPUT_PATH="build/result/$DSTAMP"
ATT_PATH="$BUILD_OUTPUT_PATH/Attachments"

xcodebuild -scheme fontsizing \
  -resultBundlePath $BUILD_OUTPUT_PATH \
  -destination 'platform=iOS Simulator,name=iPhone 8 Plus' \
  -configuration Debug test \
  -quiet

# Make a space-separated Bash array
FLIST=($(ls -1 $ATT_PATH | xargs))

echo "Converting images to gif, this may take a moment…"

# `convert` comes with imagemagick, and here we list all of the files we
# gerated, with a delay of 30/100 of a second between each frame, with a final
# output of `fonts.gif`
convert $(printf "$ATT_PATH/%s -delay 31\n" "${FLIST[@]}") fonts.gif

