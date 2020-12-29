#!/bin/bash
scriptdir="${BASH_SOURCE%/*}"

tmux new -s backend-go -d

## run main backend-go app
tmux send-keys -t backend-go:0 "cd /home/ubuntu/workspace/fr-backend-go/ && \
go build main.go && ./main" C-m

## run decodebase64 microservice
tmux new-window -t backend-go:1
# tmux send-keys -t backend-go:1 "cd /home/ubuntu/workspace/fr-backend-go/microservices/decode_base64/golang/ && \
# go build decodeBase64.go && ./decodeBase64" C-m

tmux new-window -t backend-go:2
tmux send-keys -t backend-go:2 "cd /home/ubuntu/workspace/fr-backend-go/microservices/decode_base64/python/ && \
python3 decode_base64.py" C-m
