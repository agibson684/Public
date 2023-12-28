#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <sinkId/sinkName>" >&2
    echo "Valid sinks:" >&2
    pactl list short sinks >&2
    exit 1
fi

newSink="$1"

if [  "$1" == "connect" ]; then
   bluetoothctl connect  FC:58:FA:46:59:D5
   bluetoothctl connect  00:87:63:11:20:45
	    pactl list short sinks >&2
	        exit 1
fi

if [ "$1" == "disconnect" ]; then
        bluetoothctl disconnect  FC:58:FA:46:59:D5
        bluetoothctl disconnect  00:87:63:11:20:45
        echo "Valid sinks:" >&2
	    pactl list short sinks >&2
	        exit 1
fi

pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo "moving stream $streamId"
    pactl move-sink-input "$streamId" "$newSink"
done
