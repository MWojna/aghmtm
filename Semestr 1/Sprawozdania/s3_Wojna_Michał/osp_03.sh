#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zapoznaj się z opisem struktury katalogów - polecenie man 7 hier"
}

function wyswietlroz(){
echo '$ man 7 hier'
}

function uruchomroz(){
man 7 hier
}

function komentarz(){
echo "W celu zapoznania się z opisem hierarchicznej struktury katalogów z użyciem pomocy systemo-
wej, skorzystano z polecenia terminala, man. To polecenie otwiera siódmą stronę opisu hierarchicznej 
struktury katalogów z pomocy systemowej (polecenie man)."
}

logika $@
