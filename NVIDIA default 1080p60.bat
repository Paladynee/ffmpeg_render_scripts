@echo off 
set /p filename="input filename: "
set /p additional="additional stuff: "
ffmpeg -hwaccel cuda ^
    -hwaccel_output_format cuda ^
    -i "%filename%" ^
    -c:v h264_nvenc ^
    -vf "scale_cuda=1920:1080:format=yuv420p" ^
    -y ^
    -r 60 ^
    -preset p7 ^
    -tune hq ^
    -level 4.0 ^
    -profile:v high ^
    -b:v 1000k ^
    -maxrate 1200k ^
    -bufsize 2000k ^
    -c:a libopus ^
    -b:a 128k ^
    -map_metadata -1 ^
    -map_chapters -1 ^
    -movflags faststart ^
    %additional% ^
    "%filename%_h264_nvenc_1080p_60.mp4"
pause