#!/bin/bash

. funkcje_wspolne.sh

function tresc(){
echo "Znajdź proces macierzysty dla procesu ps."
}

function wyswietlroz(){
echo '$ pf -f; ps'
}

function uruchomroz(){
ps -f;ps
}

function komentarz(){
echo "Ps -f pokazuje nam listę procesów z ich numerami PID(Process IDentification i PPID(Parent Process IDentification), za pomocą PPID możemy znaleźć PID procesu macierzystego dla procesu ps."
}

logika $@
