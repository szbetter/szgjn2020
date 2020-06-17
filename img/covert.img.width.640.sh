#!/bin/bash
identify *.* | awk '{
split($3,size,"x"); 
if(size[1]+0 > 640){
    fb=$1;
    sub(/\[[0-9]+\]$/,"",fb)
    split(fb,fs,"."); 
    ft=fs[length(fs)]; 
    gsub("."ft"$","",fb);
    cmd="convert -resize 640 "fb"."ft" "fb"-640."ft;
    print cmd
    system(cmd)
}
}'
