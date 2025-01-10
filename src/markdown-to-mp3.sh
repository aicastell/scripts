#! /bin/bash

if [ $# -ne 1 ]; then
    echo "Markdown file expected"
    exit
else
    MD_FILE=$1
    MD_FILE=$(echo $MD_FILE | cut -f 1 -d ".")
    echo "MD_FILE: $MD_FILE"
fi

echo -ne "Input file: $MD_FILE.md. Output file: $MD_FILE.mp3. Do you agree? y/n "
read AGREE

if [ $AGREE != "y" ]; then
    echo Action canceled
    exit
fi

python3 -m venv ~/venv
source ~/venv/bin/activate
# pandoc ${MD_FILE}.md -t plain --wrap=none -o ${MD_FILE}.txt
cat ${MD_FILE}.txt | gtts-cli -l es - -o ${MD_FILE}.mp3
deactivate

# Increase speed
mplayer -speed 1.1 -ao pcm:fast:file=${MD_FILE}.wav ${MD_FILE}.mp3
rm -f ${MD_FILE}.mp3
lame ${MD_FILE}.wav ${MD_FILE}.mp3
rm -f ${MD_FILE}.wav
