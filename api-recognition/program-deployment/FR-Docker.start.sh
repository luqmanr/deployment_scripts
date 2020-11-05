#!/bin/bash
docker run --gpus all --rm -it -d \
-v /home/user/.Xauthority:/home/user/.Xauthority \
-v /tmp/.X11-unix/:/tmp/.X11-unix \
-e DISPLAY=${DISPLAY} \
--device=/dev/video0:/dev/video0 \
-p 3000:3000 \
--shm-size=12g \
--name=api-recognition \
--privileged \
-v /rkbdev/facetablet/data/:/rkbdev/facetablet/data/ \
-v /home/ubuntu/workspace/face-recognition/v1.0/:/workspace/ risetai/apiface:ubuntu18
