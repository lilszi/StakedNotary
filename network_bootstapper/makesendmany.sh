#!/bin/bash 
JSON=\'{\"
END=',"'

source radds 
for radd in "${radds[@]}"; do
    JSON+=$radd\"": 5" 
    JSON+=$END
done

JSON="${JSON%??}}'"
echo $JSON
