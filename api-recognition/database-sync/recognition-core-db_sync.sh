#!/bin/bash
config_file="${BASH_SOURCE%/*}/recognition-db.env"
set -a; source $config_file; set +a

echo "syncing for database $cfr_user@$cfr_ip:$cfr_program_path$cfr_db"

rsync -chavzP --delete-after --ignore-errors -e "sshpass -p $cfr_pass ssh -p $cfr_port" \
$cfr_user@$cfr_ip:$cfr_program_path$cfr_db \
$local_cfr_db
