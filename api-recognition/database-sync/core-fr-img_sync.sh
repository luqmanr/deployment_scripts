#!/bin/bash
config_file="database.env"
set -a; source $config_file; set +a

# echo $cfr_pass, $cfr_port, $cfr_user, $cfr_ip, $cfr_program_path

rsync -chavzP --delete-after -e "sshpass -p $cfr_pass ssh -p $cfr_port" \
$cfr_user@$cfr_ip:$cfr_program_path/v1.0/media/ \
$HOME/workspace/face-recognition/v1.0/media/ 
