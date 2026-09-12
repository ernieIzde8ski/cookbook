#!/bin/sh

set -u
args=$([ $# -eq 0  ] && echo "compile:letter" || echo "$@")
while (true) do
    fd . src/ | entr doit "$args"
done
