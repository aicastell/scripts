#! /bin/bash

# Path to JSON file with birthdays
ARCHIVO_JSON="/home/aicastell/Documentos/cumples/cumples.json"
FECHA_ACTUAL="\"$(date +"%d/%m")\""

if [ ! -f $ARCHIVO_JSON ]; then
    echo "File $ARCHIVO_JSON not found"
    exit
fi

happy_birthday() {
    person_name=$1
    echo "¡Feliz cumpleaños, $person_name!"
}

jq -r 'to_entries[] | "\(.key),\(.value)"' $ARCHIVO_JSON |
while IFS=, read -r person_name cumple; do
    if [ "\"$cumple\"" == "$FECHA_ACTUAL" ]; then
        happy_birthday $person_name
    fi
done

