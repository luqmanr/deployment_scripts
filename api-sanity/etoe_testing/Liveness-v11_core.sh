#!/bin/bash
for i in {1..1}
do
    curl -X POST -H "Content-Type: application/json" \
    -d '{"pattern":"left","user_video":"/rkbdev/demo-peruri/etoe_testing/videos/'"$i"'.mp4","user_image":"/rkbdev/demo-peruri/etoe_testing/images/'"$i"'.jpg"}' \
    http://127.0.0.1:5000/LivenessVerification/v1.1/
done
