@echo off 
set /p filename="input filename: "
set /p additional="additional stuff: "
ffmpeg -hwaccel auto -i "%filename%" -c:v libx264 -vf scale=1280x720 -sws_flags lanczos+accurate_rnd -y -crf 28 -r 30 -profile:v high -preset veryslow -pix_fmt yuv420p -movflags +faststart -c:a libopus -b:a 128k -map_metadata -1 -map_chapters -1 %additional% "%filename%_x264_720p_30.mp4"
pause