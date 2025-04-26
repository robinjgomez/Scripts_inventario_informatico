# Proyecto: Scripts de Inventario Informático para Centros Educativos

## Descripción

Como parte del proyecto de **actualización de los inventarios informáticos** de las instituciones educativas que dependen de la **Consellería de Educación** de la Comunidad Valenciana, he desarrollado un conjunto de **scripts automáticos** que facilitan la **captura de datos** esenciales de los dispositivos.

El objetivo principal es **agilizar y automatizar parcialmente** el proceso de recolección de información relevante (únicos del equipo como número de serie, dirección MAC, sistema operativo, y ubicación) en dispositivos tanto **Windows** como **LliureX** (Linux), almacenando los resultados de forma estructurada para su posterior integración en hojas de cálculo oficiales proporcionadas por la administración.

---

## Estructura del USB

```plaintext
/USB/
├── 1_Ejecutar_Inventario_LliureX.sh    # Script principal para LliureX
├── 2_Ejecutar_Inventario_Windows.bat   # Lanzador fácil para Windows
├── lliurex_inventario_rutas.sh         # Contiene ejemplos de rutas absolutas al script para su rápido copiado y pegado.
├── winventario.ps1                     # Script auxiliar para Windows (no tocar)
├── inventario_YYYYMMDD.txt             # Archivo de inventario generado automáticamente
├── README.txt                          # Instrucciones y documentación
```

- **1\_Ejecutar\_Inventario\_LliureX.sh**: Script preparado para LliureX que automatiza la captura de datos, es necesario ejecutar con sudo.
- **2\_Ejecutar\_Inventario\_Windows.bat**: Archivo de ejecución rápida para usuarios de Windows, simplemente haga doble clic en este archivo y el se encargará de llamar y ejecutar el script en un entorno powershell.
- **winventario.ps1**: Scripts principal de Windows Powershell que contiene la lógica de captura, no es necesario tocarlo ni modificarlos salvo que quiera realizar cambios en la lógica. 
- **inventario_YYYYMMDD.txto**: Archivo `.txt` nombrado automáticamente según la fecha de ejecución siguiendo el formáto inventario_dia(2 dígitos)mes(2 dígitos)año(2 dígitos), en la primera ejecución del día inependientemente de el SO se generará este archivo de forma automática si no existe.
- **README.txt**: Archivo de ejecución rápida para usuarios de Windows, simplemente haga doble clic en este archi
---

## Tecnologías y herramientas utilizadas

- **Bash** para la automatización en sistemas LliureX/Linux.
- **PowerShell** para la captura de datos en Windows.

## Características principales

- **Compatibilidad multiplataforma**: Windows y LliureX.
- **Ejeción sencilla en Windows**: Solo requiere hacer doble clic en el archivo correspondiente.
- **Captura automática de datos relevantes**.
- **Generación automática de archivos de inventario** organizados por fecha.

---

## Instrucciones rápidas de uso

Almacenar en una carpeta de nombre Inventario los archivos del proyecto, es posible modificar el nombre de esta carpeta pero se requiere hacer cambiso en las rutas de los atajos y posiblemente en los scripts. 

### En LliureX

1. Conectar el USB.
2. Montar y abrir el USB.
3. Navegar en la carpeta y abrir el fichero lliurex_inventario_rutas.sh.
4. Dentro del archivo hay una ruta absluta modelo con el usuario admin de eejmplo que debes modificar por el nombre de usuario administrador con el que usualmente entras a los dispositivos.
5. Copiar la ruta modificada
6. Abrir una terminal crtl+alt+t (atajo sugerido)
7. Ejecutar con sudo, es necesario escribir la contraseña del usuario en uso:
8. Despues de capturar los datos estar atento a si se ha capturado correctamente la MAC, si no la ha caturado es probable que el dispositivo no esté conectado ni por WIFI ni por Ethernet, es necesario conectar y puedes repetir la captura.
9. En los dispositivos clonicos es probable que el fabricante no haya escrito en la BIOS el número de seríe del dispositivo, en cuyo caso encontraras la cadena "No disponible" en el campo destinado a este dato. Deberás incluirlo a mano según el procedimiento específico para estos casos.  
10. Se te preguntará si quieres incluir una ubicación del dispositivo.
11. Para terminar se preguntará si quieres apagar el dispositivo en caso de que haya sido puesto en marcha exclusivamente para esta tarea, es ese caso el proceso de apagado se encargará de desmontar de forma segurra el dispositivo USB.
12. En caso de que desees mantener el dispositivo en marcha se emitirá un ecordatorio de que es importante desmontar de forma segurá el dispositivo USB con el fín de prevenir posibles perdidas de datos.



### En Windows

1. Inserta el dispositivo usb y navega por sus archivos en una ventana del explorardor de Windows
2. Busca y ejecuta el archivo 2_Ejecutar_Inventario_Windows.bat haciendo doble clic.
3. Despues de capturar los datos estar atento a si se ha capturado correctamente la MAC, si no la ha caturado es probable que el dispositivo no esté conectado ni por WIFI ni por Ethernet, es necesario conectar y puedes repetir la captura.
4. En los dispositivos clonicos es probable que el fabricante no haya escrito en la BIOS el número de seríe del dispositivo, en cuyo caso encontraras la cadena "No disponible" en el campo destinado a este dato. Deberás incluirlo a mano según el procedimiento específico para estos casos.5. Se te preguntará si quieres incluir una ubicación del dispositivo.
6. Para terminar se preguntará si quieres apagar el dispositivo en caso de que haya sido puesto en marcha exclusivamente para esta tarea, es ese caso el proceso de apagado se encargará de desmontar de forma segurra el dispositivo USB.
7. En caso de que desees mantener el dispositivo en marcha se emitirá un ecordatorio de que es importante desmontar de forma segurá el dispositivo USB con el fín de prevenir posibles perdidas de datos.

---

## Consideraciones

- Los scripts aún estar por ser optimizados para minimizar errores relacionados con **caracteres especiales** (e.g., ñ, acentos), en tal sentido y de momento se pueden encontrar algúnas palabras en ingles que no requieren de estos caracteres especiales.
- Se recomienda **no modificar** los archivos `core` salvo necesidad técnica específica.
- El archivo de inventario puede ser editado o copiado directamente para su gestión.

---

## Autor

**Jose Lopez Lopez**

Técnico de campo en proyectos de inventariado informático y soporte IT.

[LinkedIn] | [Portafolio]

(Nota: Sustituir [LinkedIn] y [Portafolio] por enlaces reales si se desea).

---


\
Es posible modificar el formato del fichero de salída a un archivo `.csv` para facilitar su importación directa en una hoja de cálculo, si así se desea. No obstante, para este proyecto específico y debido a los requisitos de la tarea encomendada, se optó por utilizar el formato `.txt` especificado.

\
