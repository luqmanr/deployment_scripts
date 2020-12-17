#!/bin/bash
## Start Docker Containers
#${BASH_SOURCE%/*}/FV-Docker.start.sh
#${BASH_SOURCE%/*}/SSD-Docker.start.sh
#sleep 5

## Prepare tmux windows For Monitoring
tmux new -s core-liveness -d
for i in {1..3}
do
	tmux new-window -t core-liveness:$i
done

## Execute Programs Inside Docker Containers, Using tmux
# sleep 5
tmux send-keys -t core-liveness:1 "docker exec -it api-liveness python3 -m model_server.runserver lib/FeatureExtractor/serving.py" C-m
tmux send-keys -t core-liveness:2 "docker exec -it api-liveness python3 -m model_server.runserver lib/FaceLandmark/serving.py --grpc_port=5002" C-m
# sleep 10
tmux send-keys -t core-liveness:0 "docker exec -it api-liveness CUDA_VISIBLE_DEVICES=1 python3 router.py" C-m
#sleep infinity
tmux send-keys -t core-fr:3 "echo 'hello-world!'" C-m
