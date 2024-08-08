#!/bin/bash


function ctrl_c(){
  echo -e "\n\n[!] Saliendo..."
  exit 1
}

#Ctrl +C
trap ctrl_c INT

ip=$1

for port in $(seq 0 1023); do
  (echo "" > /dev/tcp/$ip/$port) 2>/dev/null && echo "[+] $ip:$port - ABIERTO"
done
