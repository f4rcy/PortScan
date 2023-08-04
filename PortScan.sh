#!/bin/bash

# ctrl + c

function ctrl_c(){
  echo -e "\n\n[x] Saliendo...\n"
  exit 1
}

trap ctrl_c INT

# script

for port in $(seq 1 65535); do
        (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "$port - OPEN"
done; wait

# lo primero es para recorrer todos los números del 1 al 65535(numero de puertos existentes).
# lo segundo (echo) escribe una cadena de texto vacia para comprobar si recibe una conexión y asi saber si esta abierto o no el puerto.
# para evitar errores ponemos el echo en () y lo redirijimos al /dev/null
# y si el primer comando es exitoso se mostrara el segundo comando que es para indicar que esta abierto el puerto.
# wait es para que vaya mas rapido y se pongan en segundo plano algunas ejecuciones.
