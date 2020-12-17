#!/bin/bash
nvidia-docker run --rm -it -d \
-p 5000:5000 \
--name=api-verification \
--privileged \
-v /rkbdev/demo-peruri/:/rkbdev/demo-peruri/ \
-v /home/riset-ai/workspace/face-verification/v1.0/:/workspace/ risetai/apiface:ubuntu18

