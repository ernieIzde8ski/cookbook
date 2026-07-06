#!/bin/sh

set -u
args=$([ $# -eq 0  ] && echo "compile:letter" || echo "$@")
while (true) do doit "$args"; sleep 1; done
