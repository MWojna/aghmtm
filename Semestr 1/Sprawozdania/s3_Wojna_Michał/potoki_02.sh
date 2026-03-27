#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Korzystając z polecenia cat utwórz plik tekst3, który będzie składał się z zawartości pliku tekst1, ciągu znaków podanego ze standardowego wejścia (klawiatury) i pliku tekst2 zawierającego dzisiejszą datę."
}

function wyswietlroz(){
echo '$ cat tekst1 > tekst3
$ cat << EOF >> tekst3
$ date > tekst2
$ cat tekst2 >> tekst3'
}

function uruchomroz(){
'cat tekst1 > tekst3
cat << EOF > > tekst3
date > tekst2
cat tekst2 >> tekst3'
}

function komentarz(){
echo "Komenda cat pozwala nam wyświetlać zawartość plików tekstowych oraz przekierowywać dane wyjściowe do innych plików za pomocą >, >>, < oraz <<. > i < nadpisują dane a >> i << dodają. EOF jest skrórem End Of File, co w tym przypadku kończy dodawanie tekstu do pliku tekst3."
}

logika $@
