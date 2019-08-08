#!/bin/bash 
cd "${BASH_SOURCE%/*}" || exit
source nodes.sh 
path="/home/test1/StakedNotary"
for node in "${nodes[@]}"; do
    echo "$node"
    ssh test1@$node -i blackjok3r2.pem "$path/makecfg.sh" | while read keys; do
        echo $keys
    done
done 
