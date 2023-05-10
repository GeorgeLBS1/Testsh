#!/bin/bash
echo "--------------------PRUEBA DE FUNCIONAMIENTO-------------------------------"

cd "$(dirname "$(readlink -f "$0")")"

while IFS= read -r line; do
  # Si la línea está en blanco o sólo contiene espacios, no hacemos nada
  if [[ -z "${line// }" ]]; then
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