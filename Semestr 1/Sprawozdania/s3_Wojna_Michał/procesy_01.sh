#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Wyświetl listę własnych procesów. Porównaj wyniki z wynikami poleceń: ps x i ps ax"
}

function wyswietlroz(){
echo '$ ps; ps x;ps ax'
}

function uruchomroz(){
ps; ps x;ps ax
}

function komentarz(){
echo "Komenda ps wyświetla listę aktywnych procesów. Przełącznik x powoduje, że komenda ps wyświetla listę procesów należących do bieżącego użytkownika. Przy użyciu przełącznika a możemy zobaczyć wszystkie procesy"
}

logika $@
