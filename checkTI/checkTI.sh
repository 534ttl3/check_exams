#!/bin/bash
echo "----- TI Hauptseite Updates: -----"

cd /home/chris/checkKlausuren/checkTI

touch newsum.txt 
#Alte Pruefsumme lesen
oldsum=$(cat newsum.txt)
echo oldsum cat newsum.txt $oldsum

#herunterladen, neue Pruefsumme zum vergleichen
newsum=$(wget -q -N http://ti.itec.uka.de/ -O index.html && sha1sum index.html)
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

echo "http://ti.itec.uka.de/"

#Vergleich
if [[ "$(echo $oldsum | cut -d" " -f1)" = "$(echo $newsum | cut -d" " -f1)" ]]; then 
  echo "checksums equal, nothing has changed"
else 
  echo "checksums not equal, SOMETHING CHANGED!"
  echo "1"
fi

