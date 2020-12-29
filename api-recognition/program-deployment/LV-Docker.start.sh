#!/bin/bash
docker run --gpus device=0 --rm -it -d \
--network host \
--name=api-liveness \
--memory="8g" \
--cpus="1.0" \
--privileged \
-v /rkbdev/demo-peruri/:/rkbdev/demo-peruri/ \
-v /home/ubuntu/workspace/face-verification/v1.0/:/workspace/ risetai/apiface:ubuntu18
