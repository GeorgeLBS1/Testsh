#!/bin/bash
echo "--------------------PRUEBA DE FUNCIONAMIENTO-------------------------------"

cd "$(dirname "$(readlink -f "$0")")"

while IFS= read -r line || [ -n "$line" ]; do
  # Eliminar los espacios en blanco de la variable $line
  line=$(echo "$line" | sed 's/ //g')
  
  # Si la línea está en blanco o sólo contiene espacios, no hacemos nada
  if [ -z "$line" ]; then
    echo "La línea está vacía, no se eliminan archivos."
  else
    echo "$line/*"
    nombre=$(basename "$line")
    echo "Directorio: $nombre"
  
    rm -r "$line"/*
    cp -r base/* "$line"
  
    sed -i "s/\"\//\"\/$nombre\//" "$line/index.html"
  fi
done < clientes0

# Leer la última línea y verificar si está vacía o no
read -r last_line
if [ -n "$last_line" ]; then
  echo "La última línea no está vacía: $last_line"
  # Aquí puedes hacer lo que quieras con la última línea
else
  echo "La última línea está vacía."
  # Aquí puedes hacer lo que quieras si la última línea está vacía
fi
