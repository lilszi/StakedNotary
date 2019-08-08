#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit
cli="$HOME/StakedNotary/komodo/master/komodo-cli -ac_name=TEST1"
radd=$($cli getnewaddress)
pubkey=$($cli validateaddress $radd | jq -r .pubkey)
wif=$($cli dumpprivkey $radd)
cfgtemp=$(<config_example.ini)
$cli setpubkey $pubkey > /dev/null &2>1
echo "$cfgtemp" | sed "s/RADD/$radd/" | sed "s/PUBKEY/$pubkey/" | sed "s/WIF/$wif/"  > config.ini
echo "$pubkey"
echo "$radd"
