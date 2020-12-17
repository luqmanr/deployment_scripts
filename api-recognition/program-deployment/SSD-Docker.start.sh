#!/bin/bash
nvidia-docker run --rm -it -d --name serving_ssd \
-v /home/riset-ai/workspace/face-recognition/recognition/lib/FaceDetector/ssd/model/serving/ssd/:/models/ssd \
-v /home/riset-ai/workspace/face-recognition/recognition/lib/serving_configurations/models-ssd.conf:/models/models-ssd.conf \
-t tensorflow/serving:latest-gpu --per_process_gpu_memory_fraction=0.3 --model_config_file=/models/models-ssd.conf
