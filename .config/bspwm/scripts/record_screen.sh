#!/bin/sh

# record - record an area of the screen

dir=~/Videos/screenrec/
current=$(date +%F_%H-%M-%S)

mkdir -p "$dir"

hacksaw | {
    IFS=+x read -r w h x y

    w=$((w + w % 2))
    h=$((h + h % 2))

    ffmpeg               \
        -v 16            \
        -r 30            \
        -f x11grab       \
        -s "${w}x${h}"   \
        -i ":0.0+$x,$y"  \
        -preset slow     \
        -c:v h264        \
        -pix_fmt yuv420p \
        -crf 28          \
        "$dir/$current.mp4"
}
