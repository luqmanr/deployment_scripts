#!/bin/bash
docker run --gpus device=0 --rm -it -d \
-v /home/user/.Xauthority:/home/user/.Xauthority \
-v /tmp/.X11-unix/:/tmp/.X11-unix \
-e DISPLAY=${DISPLAY} \
--device=/dev/video0:/dev/video0 \
-p 3000:3000 \
--shm-size=12g \
--cpus=".5" \
--memory="8g"  \
--memory-swap="8g" \
--name=api-recognition \
--privileged \
-v /rkbdev/facetablet/data/:/rkbdev/facetablet/data/ \
-v /home/ubuntu/workspace/face-recognition/v1.0/:/workspace/ risetai/apiface:ubuntu18
