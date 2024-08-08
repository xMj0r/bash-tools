#!/bin/bash

function ctrl_c(){
  echo -e "\n\n Saliento.."
  exit 1
}

#Ctrl+c
trap ctrl_c INT

url="ip.guide/"
ip="$1"
curl -sL GET $url$ip > data.json

provider=$(cat data.json | grep "name" | sed -e 's/[":,\t]//g' -e 's/name//' | awk '{$1=$1;print}')
country=$(cat data.json | grep "location" -A 2 | grep "country" | sed 's/[":,]//g' | awk '{print $NF}')
city=$(cat data.json | grep "city" | sed 's/[:",]//g' | awk '{print $NF}')
lat=$(cat data.json | grep "latitude" | awk '{print $NF}' | sed 's/,//')
long=$(cat data.json | grep "longitude" | awk '{print $NF}')



echo -e "\n[+] IP: $ip"
echo -e "[+] Proveedor: $provider"
echo -e "[+] Pais: $country"
echo -e "[+] Ciudad: $city"
echo -e "[+] Coordenadas: Latitud: ($lat) Longitud: ($long)"
