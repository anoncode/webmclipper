webmclipper
===========

webm conversion gui for ffmpeg

<img src="https://raw.githubusercontent.com/anoncode/webmclipper/master/screen.jpg"></img>

Application requires .Net Framework 4.0

Supports drag and drop of files, paths with special characters will cause things like subtitle extraction to fail.

Bitrate/Filesize is normally calculated to fit the 3MB limit.

Previews, pressing the In/Out button will load the In/Out time it's not that fast though and the progress bar next to the bitrate will indicate the frame is being decoded. 

When editing the length/end time will update the length/end time, by default the entire clip is set to be converted.

The window on the bottom is the ffmpeg commands if you want to hand edit more advanced commands; the Show commands button updates it.

Avisynth support for ffmpeg; The following tokens in the avs file will be replaced automatically upon conversion:
@I : input video file
@F : frame rate (read from the video file)
@N : Whole part of framerate multiplier
@D : Fractional part of framerate multipler

Tested with ffmpeg-20150115-git-cd960c8-win64-static.7z from 
http://ffmpeg.zeranoe.com/builds/
ffmpeg/ffprobe, put these inside the same folder as webm.exe 
or have ffmpeg/ffprobe installed and withing you environment path.
newer versions of ffmpeg than 20150115 aren't compatible.
