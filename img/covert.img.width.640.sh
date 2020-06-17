#!/bin/bash
identify $1 | awk '{
    print $3;
    split($3,size,"x"); 
    width=size[1]+0;
    fb=$1;
    sub(/\[[0-9]+\]$/,"",fb)
    split(fb,fs,"."); 
    ft=fs[length(fs)]; 
    gsub("."ft"$","",fb);
    if(width > 640){
        cmd="convert -resize 640 "fb"."ft" "fb"-640."ft;
        print cmd
        system(cmd)
    }
    if(width > 320){
        cmd="convert -resize 320 "fb"."ft" "fb"-320."ft;
        print cmd
        system(cmd)
    }
}'