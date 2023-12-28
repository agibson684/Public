#!/bin/bash
set -x 
function move {
	pactl list short sink-inputs|while read stream; do
	    streamId=$(echo $stream|cut '-d ' -f1)
	        echo "moving stream $streamId"
		    pactl move-sink-input "$streamId" "$newSink"
	    done
    }

jabraSink=$( pactl list short sinks | awk '/Jabra/{print $1}')
blueSink=$( pactl list short sinks | awk '/bluez/{print $1}')
connected=$(bluetoothctl info | awk '/Connected/{print $2}')
if [[ -n $jabraSink ]] ; then
newSink=$( pactl list short sinks | awk '/Jabra/{print $1}')
 bluetoothctl disconnect 00:FA:21:2D:AE:92
#bluetoothctl disconnect 00:87:63:11:20:45
echo 'moving to jabra'
move
exit
fi
if [[ $connected = yes ]] ; then
newSink=$( pactl list short sinks | awk '/bluez/{print $1}')
move
else 
bluetoothctl connect 00:FA:21:2D:AE:92
#bluetoothctl connect  00:87:63:11:20:45
newSink=$( pactl list short sinks | awk '/bluez/{print $1}')
move
exit
fi
