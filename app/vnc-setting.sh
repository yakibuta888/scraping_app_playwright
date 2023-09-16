#!/bin/bash
set -euxo pipefail

FILE=$HOME/.vnc/passwd
if [ -f "$FILE" ]; then
  USER="$(whoami)" vncserver :1 -depth 24 -geometry 800x600 -br -rfbport=5901 -PasswordFile=$HOME/.vnc/passwd &
  sh $HOME/.vnc/xstartup
else
  USER="$(whoami)" vncserver :1 -geometry 800x600 -depth 24
fi

export DISPLAY=:1
websockify -D --web=/usr/share/novnc/ 80 localhost:5901
