#!/bin/bash
fn=${1%.*}
echo $fn
ffmpeg -i $1 -acodec libmp3lame -ab 32k ../$fn.mp3