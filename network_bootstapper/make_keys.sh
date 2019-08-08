#!/bin/bash 
cd "${BASH_SOURCE%/*}" || exit
source nodes.sh 
echo "pubkeys=(" > pubkeys
echo "radds=(" > radds
path="/home/ubuntu/StakedNotary"
for node in "${nodes[@]}"; do
    echo "$node"
    ssh ubuntu@$node -i blackjok3r2.pem "$path/makecfg.sh" | while read keys; do
        echo 
        if [[ ${#keys} == 66 ]]; then
          echo "\"$keys\"" >> pubkeys 
        fi
        if [[ ${#keys} == 34 ]]; then
          echo "\"$keys\"" >> radds
        fi
    done
done 
echo ")" >> pubkeys 
echo ")" >> radds
