#!/bin/bash

# Execute common hook

hook=$1
target=$2

echo "Execute common hook.sh ${hook} ${target}"

pwd

do_common() {
    echo 'do_common'
}
do_before() {
    echo 'do_before'
}
do_after() {
    echo 'do_after'
}

do_common

case "${hook}" in
before)
    echo "before"
    do_before
    ;;
after)
    echo "after"
    do_after
    ;;
*)
    echo "Unknow ${hook}!"
    ;;
esac
