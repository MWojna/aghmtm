#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Sprawdź, jakie polecenia uruchomił dowolny inny użytkownik, pracujący w tej chwili w systemie."
}

function wyswietlroz(){
echo '$ ps -u'
}

function uruchomroz(){
ps -u
}

function komentarz(){
echo "By zobaczyć uruchomione przez użytkownika procesy używamy komendy ps z przełącznikiem -u oraz wpisując nazwę użytkownika, który nas interesuje."
}

logika $@
