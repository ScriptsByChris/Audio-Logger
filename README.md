# Audio-Logger

Requirements:
Streaming Server (local or remote) to record from & Streamripper


## Record broadcast.
To record your broadcast hour-by-hour, create the following cron job. Your path to the script may vary. The script will automatically stop recording 1 minute after the hour. That will give each hour an overlap of approximately two minutes.

59 * * * * /usr/local/Audio-Logger/Record-Broadcast.sh >/dev/null 2>&1


## Record program.
To record a specific program, create the following cron job. Your path to the script may vary. Two parameters are required: program name and length of program in hours. The example cron job shown below starts two minutes before the hour. It will stop two minutes after the ending hour. For example, the cron job shown below will run from 4:58AM until 9:02AM. 

58 4 * * 4 /usr/local/Audio-Logger/./Record-Program.sh "The Morning Show" 4 >/dev/null 2>&1
