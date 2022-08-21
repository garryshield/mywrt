#!/bin/bash

# Execute common hook

hook=$1
target=$2

echo "Execute common hook.sh ${hook} ${target}"

pwd

cat $GITHUB_ENV
