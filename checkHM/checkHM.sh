#!/bin/bash
echo "----- HM Updates: -----"

cd /home/chris/checkKlausuren/checkHM

touch newsum.txt 
#Alte Pruefsumme lesen
oldsum=$(cat newsum.txt)

#herunterladen, neue Pruefsumme zum vergleichen
newsum=$(wget -q -N http://www.math.kit.edu/iana3/lehre/hm3phys2016w/de -O index.html && wc -w index.html)
#zwischenspeichern
echo $newsum > newsum.txt

#Pruefen, ob erstes Mal, wenn ja, dann verlassen
if [[ -z "$oldsum" ]]; then 
  echo "oldsum not yet available"
  exit
else 
  echo "oldsum available"
fi

echo oldsum: "$oldsum"
echo newsum: "$newsum"
pwd

echo "http://www.math.kit.edu/iana3/lehre/hm3phys2016w/de"

#Vergleich
if [[ "$(echo $oldsum | cut -d" " -f1)" = "$(echo $newsum | cut -d" " -f1)" ]]; then 
  echo "checksums equal, nothing has changed"
else 
  echo "checksums not equal, SOMETHING CHANGED!"
  echo "1"
fi

