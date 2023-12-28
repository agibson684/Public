#!/bin/bash
echo 'removing all mp5 files from /pool/tvshows/'
find /pool/TV_SHOWS/ -iname *.mp5   -exec rm -vf  '{}' \;

