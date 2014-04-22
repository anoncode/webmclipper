webmclipper
===========

webm conversion gui for ffmpeg

<img src="https://raw.githubusercontent.com/anoncode/webmclipper/master/screen.jpg"></img>

Application requires .Net Framework 4.0

Supports drag and drop of files, paths with special characters will cause things like subtitle extraction to fail.

Bitrate/Filesize is normally calculated to fit the 3MB limit.

Previews, with this checked the start time and end time windows will update with previews.. it's not that fast though and the progress bars next to the length will indicate frame is being decoded. 

When editing the length/end time will update the length/end time, by default the entire clip is set to be converted.

The window on the bottom is the ffmpeg commands if you want to hand edit more advanced commands; the Show commands button updates it.

Tested with ffmpeg-20140407-git-a7a82f2-win64-static from 
http://ffmpeg.zeranoe.com/builds/
ffmpeg/ffprobe, put these inside the same folder as webm.exe
