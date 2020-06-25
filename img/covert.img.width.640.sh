#!/bin/bash

identify $1 | awk -v outsize=$2 '{
    print "file origin size: "$3;

    # 得到图片 width
    split($3,size,"x"); 
    width=size[1]+0;

    # 得到 fb(filebase name，文件基础名)、ft(file type，文件后缀名)
    fb=$1;
    sub(/\[[0-9]+\]$/,"",fb)
    split(fb,fs,"."); 
    ft=fs[length(fs)]; 
    gsub("."ft"$","",fb);

    # 原图改成960（git上留原图没必要）
    if(width > 960){
        print "Convert origin image size to: "960
        cmd="convert -resize 960 "fb"."ft" "fb"."ft;
        print cmd; system(cmd);
    }

    # 按用户指定新生成，默认480
    if (outsize == "") { outsize = 480}
    if(width > outsize){
        print "Create a new image with size: "outsize
        cmd="convert -resize "outsize" "fb"."ft" "fb"-"outsize"."ft;
        print cmd; system(cmd);
    }

    print "------"
    system("ls -l "fb"*")
}'
