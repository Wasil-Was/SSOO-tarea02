#Bastián Contreras Wasilkowski - bastian.contrerasw@alumnos.uv.cl
En este documento se explicará el diseño de solución y las funciones utilizadas para resolver la problemática planteada en la Tarea 2 de la asignatura de Sistemas Operativos.

Teniendo en cuenta el código creado, en el archivo 'script.sh' dentro de la carpeta '/src' del presente GitHub, lo primero que se realiza es declarar donde se encuentra el interprete de comandos en nuestro sistema, mediante #!/bin/bash.

Luego se procede con el conjunto de comandos que dará solución a la problemática propuesta:
   - El primer comando utilizado es el comando 'curl', junto al parámetro '-s'. El comando curl o 'Client URL' permite transferir datos desde o hacia un servidor (a través de URL), mediante los protocolos correspondientes.
En este caso, y dado que la información obtenida mediante la utilización de curl se descargará y enviará como input a otro comando mediante pipe ('|'), se utiliza el parámetro '-s' para que la herramienta entre a estado silencioso, ocultando el progreso de la descarga o mensajes de error.
   - Como se dijo anteriormente, mediante '|', simbolo que permite redireccionar el 'stdout' (standard output) del comando de la izquierda (proceso) como 'stdin' (standard input) del comando (proceso) de la derecha. Específicamente | se utiliza para redireccionar el stdout del comando curl, hacia el stdin del comando 'jq', este comando permite procesar en formato JSON la entrada comprimida del mismo, es decir, la separa con espacios y saltos de linea creando una estructura legible.
En adición al comando jq se utiliza la función 'del()' del propio comando y los corchetes '[]'. del() permite borrar una llave (key) y su valor correspondiente de un objeto, en cuanto a los corchetes, estos permiten agrupar una cantidad de elementos o llaves para su selección, al dejarlos vacios '[]' se seleccionan todos los elementos posibles.
De forma que al realizar " 'del(.payload.items[] ["thumb","url_name"])' "se indica que se eliminarán las key 'thumb' y 'url_name' para todos los items dentro de payload.
   - Posteriormente se utiliza el simbolo '>' que permite redireccionar el stdout de jq hacia un archivo.
   - Para finalizar se utiliza el comando 'echo' para mostrar en el terminal una linea de texto, señalando que la ejecución fue exitosa, y el comando 'exit 1' para indicar la finalización del proceso y una salida exitosa.

El conjunto de comandos principal se resuelve en solo una linea debido a que, a través de pruebas, se concluyó, que, en promedio, tarda lo mismo que hacer los comandos curl y jq juntos, que por separado mediante redirección hacia archivos.

Toda la información obtenida fue sacada de conocimiento previo y de las siguientes web:
  - https://stedolan.github.io/jq/manual/
  - https://stackoverflow.com/questions/36227245/deleting-multiple-keys-at-once-with-jq
