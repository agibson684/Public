#!/bin/bash 
echo 4882  > /sys/class/backlight/intel_backlight/brightness
 cat /sys/class/backlight/intel_backlight/max_brightness
