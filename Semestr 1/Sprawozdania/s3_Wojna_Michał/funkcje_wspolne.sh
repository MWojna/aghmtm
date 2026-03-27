#!/bin/bash

function autor(){
echo "autor: Michał Wojna, michalwojna@student.agh.edu.pl"
}


function help(){
echo "Lista obsługiwanych argumentów skryptu $0
-a  wyświetl informacje o autorze skryptu, imię, nazwisko, e-mail 
-t  wyświetl treść zadania 
-r  wyświetl rozwiązanie zadania 
-x  uruchom rozwiązanie zadania 
-k  wyświetl rozszerzony komentarz do rozwiązania zadania (wzięty ze sprawozdania) 
-h, --help  wyświetl pomoc do obsługiwanych argumentów. "
}

function logika(){
	if [ -z "$1" ]; then
		logika --help
		return
	fi
	while [ -n "$1" ]
	do
		case "$1" in
		-a) autor ;;
		-t) tresc ;;
		-r) wyswietlroz ;;
		-x) uruchomroz ;;
		-k) komentarz ;;
		-h| --help) help ;;
		*) echo "zobacz: $0 --help"
		break ;;
		esac
		shift
	done
}
