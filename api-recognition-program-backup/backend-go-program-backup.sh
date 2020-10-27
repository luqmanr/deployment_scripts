#!/bin/bash
## sync fr-backend-go
rsync -chavzP --exclude-from='ignored-list.txt' --delete-after -e "sshpass -p adminRKB ssh -p 25025" \
ubuntu@202.158.77.42:/home/ubuntu/workspace/fr-backend-go/ \
/home/ubuntu/workspace/fr-backend-go/

rsync -chavzP --exclude-from='ignored-list.txt' --delete-after -e "sshpass -p adminRKB ssh -p 25025" \
ubuntu@202.158.77.42:/home/ubuntu/workspace/fr-backend-go-newDBscheme/ \
/home/ubuntu/workspace/fr-backend-go-newDBscheme/
