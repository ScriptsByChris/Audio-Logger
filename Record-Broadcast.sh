#!/bin/bash

## Settings
Station=""
StreamURL=""
SaveFolderRoot=""

## Date/Time
Hour=$(date --date="next hour" +"%H")
DateLastHour=$(date --date="last hour" +"%Y-%m-%d")
YearLastHour=$(date --date="last hour" +"%Y")


## Determine file name and location. Create the directory for the file date.
if [ $Hour -eq 0 ]; then
        Date=$(date --date="tomorrow" +"%Y-%m-%d")
        FolderDate=$(date --date="tomorrow" +"%Y-%m")
        FolderYear=$(date --date="tomorrow" +"%Y")
else
        Date=$(date --date="today" +"%Y-%m-%d")
        FolderDate=$(date --date="today" +"%Y-%m")
        FolderYear=$(date --date="today" +"%Y")
fi

Dir="${SaveFolderRoot}/Broadcast/${FolderYear}/${FolderDate}/${Date}"
File="${Station} -- ${Date}  Hour ${Hour}"

mkdir -p "${Dir}"


## Record the stream.
streamripper ${StreamURL} -a "${File}.mp3" -A -d "${Dir}" -i -k 0 -s -l 3720 -u "${Station}" --quiet


sleep 30

## Create the id3 tags.
id3v2 -D "${Dir}/${File}.mp3"
id3v2 -t "${File}" -a "${Station}" "${Dir}/${File}.mp3"


## Remove unnecessary files.
rm "${Dir}/${File}.cue"
