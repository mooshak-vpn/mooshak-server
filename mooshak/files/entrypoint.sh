#!/bin/sh

./run-udpgw.sh  &
process_id=$!
./ssh.sh  &
wait $process_id
wait $!

exit $?
