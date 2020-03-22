#!/bin/bash 
#Zusammenfassung 
 
output="$(/home/chris/checkKlausuren/checkTI/checkTI.sh)"
changed=$(echo "$output" | tail -1)

echo "$output"
echo tail: "$changed"

if [[ "$changed" = "1" ]]; then 
  echo "$output" | mail -s TI Update 534ttl3@gmail.com 
fi
 
output="$(/home/chris/checkKlausuren/checkHM/checkHM.sh)"
changed=$(echo "$output" | tail -1)

echo "$output"
echo tail: "$changed"

if [[ "$changed" = "1" ]]; then 
  echo "$output" | mail -s HM Update 534ttl3@gmail.com 
fi
