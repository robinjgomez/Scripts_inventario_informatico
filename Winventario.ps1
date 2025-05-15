# Fecha actual en formato ddmmyyyy
$fecha = Get-Date -Format "ddMMyyyy"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Obtener número de serie
$serialNumber = (Get-WmiObject Win32_BIOS).SerialNumber
if ([string]::IsNullOrEmpty($serialNumber) -or $serialNumber -eq "To Be Filled by O.E.M.") {
    $serialNumber = "ATENCION N/S NO DISPONIBLE Y NO CAPTURADO"
}

# Obtener MAC Address activa
$macAddress = (Get-WmiObject Win32_NetworkAdapterConfiguration |
    Where-Object {
        $_.IPEnabled -eq $true -and
        $_.Description -notmatch "virtual|VMware|VirtualBox"
    } |
    Select-Object -First 1 -ExpandProperty MACAddress
)

# Obtener versión de Windows
$osVersion = (Get-WmiObject Win32_OperatingSystem).Caption

# Ubicación del dispositivo
$deviceLocation = Read-Host "Escribe la ubicacion del dispositivo"

# Ruta del archivo con fecha actual
$usbDrive = $PSScriptRoot
$outputFile = "$usbDrive\inventario$fecha.txt"

# Escribir datos
@"
Serial Number: $serialNumber
MAC Address: $macAddress
OS Version: $osVersion
Location: $deviceLocation
---
"@ | Add-Content -Path $outputFile -Encoding utf8

# Mostrar resultados
Write-Output @"
******************************************
* Se han capturado los siguientes datos: *
******************************************
Serial Number: $serialNumber
MAC Address: $macAddress
OS Version: $osVersion
Location: $deviceLocation
"@

# Apagar equipo si se desea
$confirmShutdown = Read-Host "Deseas apagar el equipo ahora? (S/N)"
if ($confirmShutdown -match '^[sS]$') {
    Write-Output "Apagando el equipo..."
    Stop-Computer -Force
} else {
    Write-Output "No olvides expulsar el USB de forma segura."
}
