#!/bin/bash

echo -en "\0prompt\x1fINFO\n"
echo "$(~/.Null/Devs/myScripts/timedate.sh)" 
echo Battery
echo "$(~/.Null/Devs/myScripts/powerStatus.sh)"
echo "$(wifi)
$(bluetooth)"
