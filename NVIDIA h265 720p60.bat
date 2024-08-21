@echo off 
set /p filename="input filename: "
set /p additional="additional stuff: "
ffmpeg -hwaccel cuda ^
    -hwaccel_output_format cuda ^
    -i "%filename%" ^
    -c:v hevc_nvenc ^
    -vf "scale_cuda=1280:720:format=yuv420p" ^
    -y ^
    -r 60 ^
    -preset p7 ^
    -tune hq ^
    -b:v 900k ^
    -maxrate 1100k ^
    -bufsize 2000k ^
    -c:a libopus ^
    -b:a 128k ^
    -map_metadata -1 ^
    -map_chapters -1 ^
    -movflags faststart ^
    %additional% ^
    "%filename%_hevc_nvenc_720p_60.mp4"
pause