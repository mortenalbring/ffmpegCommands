:: https://video.stackexchange.com/questions/19867/how-to-fade-in-out-a-video-audio-clip-with-unknown-duration

ffmpeg -i input.mp4 -sseof -1 -copyts -i input.mp4 -filter_complex "[1]fade=out:0:30[t];[0][t]overlay,fade=in:0:30[v];        anullsrc,atrim=0:2[at];[0][at]acrossfade=d=1,afade=d=1[a]" -map "[v]" -map "[a]" -c:v libx264 -crf 22 -preset veryfast -shortest fadeInOut.mp4