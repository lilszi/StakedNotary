#!/bin/bash 
JSON=\"{\"
END=',"'

source radds 
for radd in "${radds[@]}"; do
    JSON+=$radd\"": 100" 
    JSON+=$END
done

JSON="${JSON%??}}\""
echo $JSON
