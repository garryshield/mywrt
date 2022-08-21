#!/bin/bash

# Execute target hook

hook=$1
target=$2

echo "Execute target hook.sh ${hook} ${target}"

pwd

cat $GITHUB_ENV
