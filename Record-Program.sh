#!/bin/bash

## Settings
Station=""
StreamURL=""
SaveFolderRoot=""

## Parameters
Program="${1}"
LengthHours=${2}

# Calculate length in seconds.
LengthSeconds=$((LengthHours*60*60+240))


## Date/Time
Date=$(date --date="today" +"%Y-%m-%d")
Time=$(date --date="today" +"%H:%M:%S")


## Determine file name and location. Create the directory for the file date.
Dir="${SaveFolderRoot}/Programs/${Program}"
File="${Program} - ${Date}"

mkdir -p "${Dir}"


## Record the stream.
streamripper ${StreamURL} -a "${File}.mp3" -A -d "${Dir}" -i -k 0 -s -l $LengthSeconds -u "${Station}" --quiet

sleep 30

## Create the id3 tags.
id3v2 -D "${Dir}/${File}.mp3"
id3v2 -t "${File}" -a "${Station}" "${Dir}/${File}.mp3"


## Remove unnecessary files.
rm "${Dir}/${File}.cue"
