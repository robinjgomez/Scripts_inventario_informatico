#!/bin/bash

# Obtener fecha actual en formato ddmmyyyy
fecha=$(date +%d%m%Y)

# Obtener número de serie
serialNumber=$(sudo dmidecode -s system-serial-number 2>/dev/null)
if [[ -z "$serialNumber" || "$serialNumber" == "To Be Filled by O.E.M." ]]; then
    serialNumber="No disponible"
fi

# Obtener MAC Address activa (Ethernet o Wi-Fi)
macAddress=$(ip link show | awk '/ether/ && !/virbr|vmnet|vbox/ {print $2; exit}' | tr '[:lower:]' '[:upper:]')

# Obtener versión del sistema operativo
lliurexVersion=$(lliurex-version 2>/dev/null)
if [[ -z "$lliurexVersion" ]]; then
    lliurexVersion="No disponible"
fi

# Pedir ubicación del dispositivo
echo "Escribe la ubicación del dispositivo:"
read deviceLocation

# Ruta del script y archivo de salida con fecha
usbDrive=$(dirname "$(readlink -f "$0")")
outputFile="$usbDrive/inventario$fecha.txt"

# Guardar en archivo
{
    echo "Serial Number: $serialNumber"
    echo "MAC Address: $macAddress"
    echo "LliureX Version: $lliurexVersion"
    echo "Ubicación: $deviceLocation"
    echo "---"
} >> "$outputFile"

# Mostrar en pantalla
echo "Datos guardados en $outputFile"
echo "******************************************"
echo "* Se han capturado los siguientes datos: *"
echo "******************************************"
echo "Serial Number: $serialNumber"
echo "MAC Address: $macAddress"
echo "Version de SO: $lliurexVersion"
echo "Ubicación: $deviceLocation"

# Preguntar si se quiere apagar
read -p "¿Apagar el equipo ahora? (s/n): " respuesta
if [[ "$respuesta" =~ ^[sS]$ ]]; then
    echo "Apagando el equipo..."
    sudo poweroff
else
    echo "No olvides desmontar el USB de forma segura."
fi
