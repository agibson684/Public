#!/bin/bash

 if [ "$1" = '-d' ]; then
  gunzip -c "$2"| grep "$3" |  sort -n| less
exit 0
else
grep "$1" "$2" |  sort -n| less
exit 0
fi
exit 1
