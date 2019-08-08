#!/bin/bash 
arr='{"'
mid='": "'
end='" },'
source pubkeys
cp elected.tmplt elected.json
i=0 
for pub in "${pubkeys[@]}"; do
    echo "    $arr"test"$i$mid$pub$end" >> elected.json
    i=$(( i + 1 ))
done

END=$(tail -1 elected.json)
END="${END%?} "
sed -i '$ d' elected.json
echo "   "$END >> elected.json
echo "]" >> elected.json
echo "}" >> elected.json

cp ../staked.json staked.bak 
mv elected.json ../staked.json
