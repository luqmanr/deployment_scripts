#!/bin/bash
scriptdir="$(dirname "$0")"
## Start Docker Containers
$scriptdir/FR-Docker.start.sh
$scriptdir/SSD-Docker.start.sh

sleep 10

## Prepare tmux windows For Monitoring
tmux new -s core-fr -d
for i in {1..4}
do
	tmux new-window -t core-fr:$i
done

## Execute Programs Inside Docker Containers, Using tmux
sleep 5
tmux send-keys -t core-fr:1 "docker exec -it api-recognition python3 -m model_server.runserver lib/FeatureExtractor/serving.py" C-m
tmux send-keys -t core-fr:2 "docker exec -it api-recognition python3 auto_train.py" C-m
sleep 10
tmux send-keys -t core-fr:0 "docker exec -it api-recognition python3 fr_api.py" C-m