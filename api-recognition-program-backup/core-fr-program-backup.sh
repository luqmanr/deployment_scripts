#!/bin/bash
## sync face-recognition
rsync -chavzP --delete-after --exclude-from='ignored-list.txt' -e "sshpass -p adminRKB ssh -p 23023" \
riset-ai@202.158.77.42:/home/riset-ai/workspace/face-recognition/v1.0/ \
/home/ubuntu/workspace/face-recognition/v1.0/