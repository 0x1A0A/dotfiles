#!/bin/bash
upower -i $( upower -e | grep -i bat ) | grep -E "state|percen|time"
