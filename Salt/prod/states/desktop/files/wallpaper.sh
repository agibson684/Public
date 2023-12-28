#!/bin/bash
PATH=/usr/bin
DISPLAY=:0
export DISPLAY
dirs=(~/backgrounds)
walls=()

while IFS= read -d '' -r file ; do
        walls+=("$file")
done < <(
        find "${dirs[@]}" \
                -type f '(' \
                        -iname '*.jp*g' -o -iname '*.png' -o -iname '*.gif' \
                ')' \
                -not -path '*/nsfw/*' \
                -print0
)

img="${walls[$(( RANDOM %  ${#walls[@]} ))]}"
feh --bg-max "$img"
echo "$img" > ~/.currentbg

