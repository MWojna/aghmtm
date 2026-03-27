#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Zbadaj działanie przełączników l i u."
}

function wyswietlroz(){
echo '$ ps l; ps u'
}

function uruchomroz(){
ps l; ps u
}

function komentarz(){
echo "Przełącznik l wyświetla aktywne procesy w formacie długim, który pokazuje nam więcej informacji, przełącznik u wyświetla aktywne procesy w formacie, który jest wygodny dla użytkownika."
}

logika $@
