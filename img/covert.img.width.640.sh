#!/bin/bash
# 原图改成960（git上留原图没必要），新生成480（320手机直接放大不能看）
identify $1 | awk '{
    print $3;
    split($3,size,"x"); 
    width=size[1]+0;
    fb=$1;
    sub(/\[[0-9]+\]$/,"",fb)
    split(fb,fs,"."); 
    ft=fs[length(fs)]; 
    gsub("."ft"$","",fb);
    if(width > 960){
        cmd="convert -resize 960 "fb"."ft" "fb"."ft;
        print cmd
        system(cmd)
    }
    if(width > 480){
        cmd="convert -resize 480 "fb"."ft" "fb"-480."ft;
        print cmd
        system(cmd)
    }
}'
