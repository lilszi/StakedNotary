#!/bin/bash
radd=$(komodo-cli -ac_name=TEST1 getnewaddress)
pubkey=$(komodo-cli -ac_name=TEST1 validateaddress $radd | jq -r .pubkey)
wif=$(komodo-cli -ac_name=TEST1 dumpprivkey $radd)
cfgtemp=$(<config_example.ini)
./asset-cli setpubkey $pubkey > /dev/null &2>1
echo "$cfgtemp" | sed "s/RADD/$radd/" | sed "s/PUBKEY/$pubkey/" | sed "s/WIF/$wif/"  > config_test.ini
echo "$pubkey"
echo "$radd"
