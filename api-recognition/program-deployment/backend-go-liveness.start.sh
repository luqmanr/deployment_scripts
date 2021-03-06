#!/bin/bash
scriptdir="${BASH_SOURCE%/*}"

tmux new -s backend-go-liveness -d

## run main backend-go app
tmux send-keys -t backend-go-liveness:0 "cd /home/ubuntu/workspace/fr-backend-demo-peruri/ && \
go build main.go && ./main" C-m

## run sandbox BE
tmux new-window -t backend-go-liveness:1
tmux send-keys -t backend-go:1 "cd /home/ubuntu/workspace/sandbox-BE-liveness-verification/ && \
go build main.go && ./main" C-m

## Run DecodeBase64 Service
tmux new-window -t backend-go-liveness:2
tmux send-keys -t backend-go-liveness:2 "cd /home/ubuntu/workspace/fr-backend-demo-peruri/microservices/decode_base64/python/ && \
python3 decode_base64.py" C-m
