#!/bin/bash
echo "--------------------PRUEBA DE FUNCIONAMIENTO-------------------------------"

cd "$(dirname "$(readlink -f "$0")")"

while IFS= read -r line || [ -n "$line" ]; do
  # Eliminar los espacios en blanco de la variable $line
  line=$(echo "$line" | sed 's/ //g')
  
  # Si la línea está en blanco o sólo contiene espacios, no hacemos nada
  if [ -z "$line" ]; then
    echo "La línea está vacía, no se realiza carga de '/base/*' a esta ruta."
  else
    echo "Se realizarán modificaciones en: $line/*"
    nombre=$(basename "$line")
    sitio="$pwd/$nombre"
    echo "Directorio: $sitio"
  
    rm -r "$line"/*
    cp -r base/* "$line"
  
    sed -i "s/\"\//\"\/$sitio\//" "$line/index.html"
  fi
done < clientes0

# El comando "true" no hace nada y devuelve 0 (éxito).
true
