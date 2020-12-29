#!/bin/bash
workdir="/rkbdev/demo-peruri/etoe_testing/videos"
ls -v "$workdir" | cat -n | \
while read n f
do
    echo "$workdir/$f" "$workdir/$n.mp4"
    mv -n "$workdir/$f" "$workdir/$n.mp4"
done 
