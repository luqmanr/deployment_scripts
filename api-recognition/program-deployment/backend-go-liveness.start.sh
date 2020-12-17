#!/bin/bash
scriptdir="${BASH_SOURCE%/*}"

tmux new -s backend-go-liveness -d

## run main backend-go app
tmux send-keys -t backend-go-liveness:0 "cd /home/riset-ai/workspace/BE-liveness-verification/ && \
go build main.go && ./main" C-m

## run decodebase64 microservice
tmux new-window -t backend-go-liveness:1
# tmux send-keys -t backend-go:1 "cd /home/riset-ai/workspace/fr-backend-go/microservices/decode_base64/golang/ && \
# go build decodeBase64.go && ./decodeBase64" C-m

tmux new-window -t backend-go-liveness:2
tmux send-keys -t backend-go-liveness:2 "cd /home/riset-ai/workspace/BE-liveness-verification/microservices/decode_base64/python/ && \
python3 decode_base64.py" C-m
