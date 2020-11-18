#!/bin/bash
config_file="${BASH_SOURCE%/*}/programs.env"
set -a; source $config_file; set +a

rsync -chavzP --exclude-from="${BASH_SOURCE%/*}/ignored-list.txt" --delete-after -e "sshpass -p $bg_pass ssh -p $bg_port" \
$bg_user@$bg_ip:$bg_program_path \
$local_bg_program_path

rsync -chavzP --exclude-from="${BASH_SOURCE%/*}/ignored-list.txt" --delete-after -e "sshpass -p $cfr_pass ssh -p $cfr_port" \
$cfr_user@$cfr_ip:$cfr_program_path \
$local_cfr_program_path
