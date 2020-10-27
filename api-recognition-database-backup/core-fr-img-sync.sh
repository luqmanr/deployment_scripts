#!/bin/bash
## sync user_images
remote_user="riset-ai"
remote_IP="202.158.77.42"
remote_port="23023"
remote_home="/home/$remote_user"

rsync -chavzP --delete-after -e "sshpass -p adminRKB ssh -p $remote_port" \
$remote_user@$remote_IP:$remote_home/workspace/face-recognition/fr_dam/media/data_face_mask/ \
$HOME/workspace/face-recognition/fr_dam/media/data_face_mask/

rsync -chavzP --delete-after -e "sshpass -p adminRKB ssh -p $remote_port" \
$remote_user@$remote_IP:$remote_home/workspace/face-recognition/v1.0/media/data_face_mask/ \
$HOME/workspace/face-recognition/v1.0/media/data_face_mask/


## sync .csv database
rsync -chavzP --delete-after -e "sshpass -p adminRKB ssh -p $remote_port" \
$remote_user@$remote_IP:$remote_home/workspace/face-recognition/fr_dam/media/csv_database_mask/ \
$HOME/workspace/face-recognition/fr_dam/media/csv_database_mask/

rsync -chavzP --delete-after -e "sshpass -p adminRKB ssh -p $remote_port" \
$remote_user@$remote_IP:$remote_home/workspace/face-recognition/v1.0/media/csv_database_mask/ \
$HOME/workspace/face-recognition/v1.0/media/csv_database_mask/

## sync `New`.csv database
rsync -chavzP --delete-after -e "sshpass -p adminRKB ssh -p $remote_port" \
$remote_user@$remote_IP:$remote_home/workspace/face-recognition/fr_dam/media/new_csv_database/ \
$HOME/workspace/face-recognition/fr_dam/media/new_csv_database/

rsync -chavzP --delete-after -e "sshpass -p adminRKB ssh -p $remote_port" \
$remote_user@$remote_IP:$remote_home/workspace/face-recognition/v1.0/media/new_csv_database/ \
$HOME/workspace/face-recognition/v1.0/media/new_csv_database/
