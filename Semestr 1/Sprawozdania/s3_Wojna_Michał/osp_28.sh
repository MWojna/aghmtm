#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Utwórz dowiązanie symboliczne do katalogu dir/bin o nazwie abc w katalogu domowym."
}

function wyswietlroz(){
echo '$ mkdir abc
$ ln -s /dir/bin/ abc/'
}

function uruchomroz(){
mkdir abc; ln -s /dir/bin/ abc/
}

function komentarz(){
echo "Komenda ln służy do tworzenia dowiązań twardych i symbolicznych między plikami lub katalogami. Tworzymy dowiązanie symboliczne, gdzie plik o nazwie abc jest dowiązany do katalogu bin."
}

logika $@
