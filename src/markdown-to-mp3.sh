#! /bin/bash

if [ $# -ne 1 ]; then
    echo "Markdown file expected"
    exit
else
    MD_FILE=$1
    MD_FILE=$(echo $MD_FILE | cut -f 1 -d ".")
    echo "MD_FILE: $MD_FILE"
fi

echo -ne "A partir de $MD_FILE.md voy a crear $MD_FILE.mp3. Estar de acuerdo? y/n "
read AGREE

if [ $AGREE != "y" ]; then
    echo Action canceled
    exit
fi

python3 -m venv ~/venv
source ~/venv/bin/activate
pandoc ${MD_FILE}.md -t plain --wrap=none -o ${MD_FILE}.txt
cat ${MD_FILE}.txt | gtts-cli -l es - -o ${MD_FILE}.mp3
deactivate
