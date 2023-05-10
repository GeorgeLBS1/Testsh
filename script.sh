#!/bin/bash
echo "--------------------PRUEBA DE FUNCIONAMIENTO-------------------------------"

cd "$(dirname "$(readlink -f "$0")")"
	
	while IFS= read -r line
	do	
		echo $line'/*'
		nombre=$(basename $line)
		echo 'DIrectorio:' $nombre
		
		rm -r $line/*
		##for archivo in base/*
		##do
			##echo 'ARCHIVO A COPIAR: ' $archivo
			cp -r base/* "$line"
			
		##done
		sed -i "s/\"\//\"\/$nombre\//" $line/index.html
	done < clientes0
