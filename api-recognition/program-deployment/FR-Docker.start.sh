#!/bin/bash
docker run --gpus device=0 --rm -it -d \
--network host \
--memory="8g" \
--cpus="1.0" \
--name=api-recognition \
--privileged \
-v /rkbdev/facetablet/data/:/rkbdev/facetablet/data/ \
-v /home/ubuntu/workspace/face-recognition/v1.0/:/workspace/ risetai/apiface:ubuntu18
