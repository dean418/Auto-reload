#!/bin/bash

directory=$1
windowName=$2
codeEditor=$3

inotifywait -r -m -e modify $directory | while read path _ file; do
	browser=`xdotool search --name "$windowName" | head -1`
	xdotool windowactivate $browser
	xdotool key F5
	sleep 0.2;
	editor=`xdotool search --name "$3" | tail -1`
	xdotool windowactivate $editor
done