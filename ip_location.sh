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

provider=$(cat data.json | grep "name" | sed 's/[name":,\t]//g' | awk '{$1=$1;print}')
country=$(cat data.json | grep "location" -A 2 | grep "country" | sed 's/[country":,]//g' | awk '{$1=$1; print}')
city=$(cat data.json | grep "city" | sed 's/[city:",]//g' | awk '{$1=$1; print}')
lat=$(cat data.json | grep "latitude" | awk '{print $NF}' | sed 's/,//')
long=$(cat data.json | grep "longitude" | awk '{print $NF}')



echo -e "\n[+] IP: $ip"
echo -e "[+] Proveedor: $provider"
echo -e "[+] Pais: $country"
echo -e "[+] Ciudad: $city"
echo -e "[+] Coordenadas: Latitud: ($lat) Longitud: ($long)"
