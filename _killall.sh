#!/bin/bash
xterm -geometry 80x36+0+0 -e "rosnode kill -a" & sleep 0.1
killall xterm
