#!/bin/bash
docker run --rm -it -d --gpus device=0 --name serving_ssd \
--cpus=".5" \
--memory="8g" \
--memory-swap="8g" \
-v /home/ubuntu/workspace/face-recognition/recognition/lib/FaceDetector/ssd/model/serving/ssd/:/models/ssd \
-v /home/ubuntu/workspace/face-recognition/recognition/lib/serving_configurations/models-ssd.conf:/models/models-ssd.conf \
-t tensorflow/serving:latest-gpu --per_process_gpu_memory_fraction=0.3 --model_config_file=/models/models-ssd.conf
