@echo off 
set /p filename="input filename: "
ffmpeg -hwaccel auto -i "%filename%" -vf scale=1280x720 -sws_flags lanczos+accurate_rnd -y -r 60 -c:v libvpx-vp9 -b:v 0 -crf 51 -pass 1 -quality good -threads 8 -lag-in-frames 25 -cpu-used 4 -auto-alt-ref 1 -arnr-maxframes 7 -aq-mode 0 -tile-rows 0 -tile-columns 1 -row-mt 1 -enable-tpl 1 -an -f null /dev/null && \
ffmpeg -hwaccel auto -i "%filename%" -vf scale=1280x720 -sws_flags lanczos+accurate_rnd -y -r 60 -c:v libvpx-vp9 -b:v 0 -crf 51 -pass 2 -quality good -threads 8 -lag-in-frames 25 -cpu-used 4 -auto-alt-ref 1 -arnr-maxframes 7 -aq-mode 0 -tile-rows 0 -tile-columns 1 -row-mt 1 -enable-tpl 1 -c:a libopus -b:a 128k -map_metadata -1 -map_chapters -1 "%filename%_vp9_720p_60.webm"
del ".\ffmpeg2pass-0.log"
pause

REM ffmpeg -hwaccel auto -i "%filename%" -vf scale=1280x720 -sws_flags lanczos+accurate_rnd -y -r 60 -c:v libvpx-vp9 -b:v 0 -crf 45 -pass 1 -quality good -threads 8 -profile:v 2 -lag-in-frames 25 -g 240 -cpu-used 4 -auto-alt-ref 1 -arnr-maxframes 7 -aq-mode 0 -tile-rows 0 -tile-columns 1 -row-mt 1 -enable-tpl 1 -an -f null /dev/null && \
REM ffmpeg -hwaccel auto -i "%filename%" -vf scale=1280x720 -sws_flags lanczos+accurate_rnd -y -r 60 -c:v libvpx-vp9 -b:v 0 -crf 45 -pass 2 -quality good -threads 8 -profile:v 2 -lag-in-frames 25 -g 240 -cpu-used 4 -auto-alt-ref 1 -arnr-maxframes 7 -aq-mode 0 -tile-rows 0 -tile-columns 1 -row-mt 1 -enable-tpl 1 -c:a libopus -b:a 128k -map_metadata -1 -map_chapters -1 "%filename%_vp9_720p_60.webm"
