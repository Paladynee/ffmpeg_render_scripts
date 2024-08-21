@echo off 
set /p filename="input filename: "
ffmpeg -hwaccel auto -i "%filename%" -c:v libx264 -vf scale=1920x1080 -sws_flags lanczos+accurate_rnd -y -crf 24 -r 60 -profile:v high -preset veryslow -pix_fmt yuv420p -movflags +faststart -c:a libopus -b:a 128k -map_metadata -1 -map_chapters -1 "%filename%_x264_1080p_60.mp4"
pause