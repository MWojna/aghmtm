#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sprawdź kto jest zalogowany w chwili obecnej w systemie."
}

function wyswietlroz(){
echo '$ who'
}

function uruchomroz(){
who
}

function komentarz(){
echo "W  celu  wyświetlenie  listy  aktualnie  zalogowanych 
użytkowników w systemie Linux korzystamy z komendy who, która zwraca listę użytkowników, nazwę 
terminala i datę dostępu"
}

logika $@
