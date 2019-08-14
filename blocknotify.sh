#!/bin/bash
cd ~/StakedNotary

./listassetchains.py | while read coin; do
  echo $coin
  conf="$HOME/.komodo/$coin/$coin.conf"
  if [[ -f $conf ]]; then
    echo "blocknotify=curl -s --url \"http://127.0.0.1:7776\" --data \"{\\\"agent\\\":\\\"dpow\\\",\\\"method\\\":\\\"updatechaintip\\\",\\\"blockhash\\\":\\\"%s\\\",\\\"symbol\\\":\\\"$coin\\\"}\"" >> $conf
  else
     echo "failed"
   fi 
done
