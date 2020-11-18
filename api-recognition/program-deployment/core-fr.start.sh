#!/bin/bash
## Start Docker Containers
${BASH_SOURCE%/*}/FR-Docker.start.sh
${BASH_SOURCE%/*}/SSD-Docker.start.sh
sleep 5

## Prepare tmux windows For Monitoring
tmux new -s core-fr -d
for i in {1..3}
do
	tmux new-window -t core-fr:$i
done

## Execute Programs Inside Docker Containers, Using tmux
# sleep 5
tmux send-keys -t core-fr:1 "docker exec -it api-recognition python3 -m model_server.runserver lib/FeatureExtractor/serving.py" C-m
tmux send-keys -t core-fr:2 "docker exec -it api-recognition python3 new_auto_training.py" C-m
# sleep 10
tmux send-keys -t core-fr:0 "docker exec -it api-recognition python3 fr_api.py" C-m
sleep infinity
tmux send-keys -t core-fr:3 "echo 'hello-world!'" C-m
