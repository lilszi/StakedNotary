#!/bin/bash 
cd "${BASH_SOURCE%/*}" || exit
last=0
if [[ $1 == "NA" ]]; then 
    source nodes_NA.sh
    pem="blackjok3r_NA.pem"
    echo "pubkeys=(" > pubkeys
    echo "radds=(" > radds
elif [[ $1 == "SA" ]]; then 
    source nodes_SA.sh
    pem="blackjok3r_SA.pem"
elif [[ $1 == "AR" ]]; then
    source nodes_AR.sh
    pem="blackjok3r_AR.pem"
elif [[ $1 == "EU" ]]; then
    source nodes_EU.sh
    pem="blackjok3r_EU.pem"
    last=1
else
    echo "no region input"
fi

path="/home/ubuntu/StakedNotary"
for node in "${nodes[@]}"; do
    echo "$node"
    ssh ubuntu@$node -i $pem "$path/makecfg.sh" | while read keys; do
        echo 
        if [[ ${#keys} == 66 ]]; then
          echo "\"$keys\"" >> pubkeys 
        fi
        if [[ ${#keys} == 34 ]]; then
          echo "\"$keys\"" >> radds
        fi
    done
done 

if [[ $last -eq 1 ]]; then
    echo ")" >> pubkeys 
    echo ")" >> radds
fi
