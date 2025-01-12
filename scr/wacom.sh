#!/bin/sh

list=$(xsetwacom list devices)
pad=$(echo "${list}" | awk '/pad/{print $8}')
stylus=$(echo "${list}" | awk '/stylus/{print $8}')

if [ -z "${pad}" ]; then
    exit 0
fi

xsetwacom set $stylus MapToOutPut 1920x1200+0+0
xsetwacom set $stylus Area 0 0 15200 9500
