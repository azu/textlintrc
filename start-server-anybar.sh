#!/bin/bash
set -ex
# Require: https://github.com/tonsky/AnyBar

function anybar () {
    echo -n "$1" | nc -4u -w0 localhost "${2:-1738}";
}

GrammaPort=12468
npx gramma server stop
yes | npx gramma server start --port $GrammaPort
ANYBAR_PORT=1738
ANYBAR_PORT=$ANYBAR_PORT ANYBAR_TITLE=Gramma open -n /Applications/AnyBar.app
sleep 1
anybar orange $ANYBAR_PORT
ret=$?
if [[ ret -eq 0 ]]; then
    anybar green $ANYBAR_PORT
else
    anybar red $ANYBAR_PORT
fi