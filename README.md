# Audio-Logger

Requirements:
Streaming Server (local or remote) to record from & Streamripper

I won't explain how to configure it, but you can install Icecast2 easily enough in Debian by running apt-get install icecast2. You can, of course, just use your existing streaming server. I typically install one on the same system as these scripts so I can record at a higher bitrate and not worrry about losing anything if my Internet connection or public streaming server go down.

If streamripper is not already installed, you can do so by running apt-get install streamripper.

cd /usr/local
git clone https://github.com/ScriptsByChris/Audio-Logger

Edit each of the scripts and modify the following lines to reflect your station call letters or name, stream URL and where you want to save your files.

Station=""<br />
StreamURL=""<br />
SaveFolderRoot=""<br />


## Record broadcast.
To record your broadcast hour-by-hour, create the following cron job. Your path to the script will vary if you didn't clone this repository to /usr/local. The script will automatically stop recording 1 minute after the hour. That will give each hour an overlap of approximately two minutes.

59 * * * * /usr/local/Audio-Logger/./Record-Broadcast.sh >/dev/null 2>&1


## Record program.
To record a specific program, create the following cron job. Your path to the script will vary if you didn't clone this repository to /usr/local. Two parameters are required: program name and length of program in hours. The example cron job shown below starts two minutes before the hour. It will stop two minutes after the ending hour. For example, the cron job shown below will run from 4:58AM until 9:02AM. 

58 4 * * 1-5 /usr/local/Audio-Logger/./Record-Program.sh "The Morning Show" 4 >/dev/null 2>&1
