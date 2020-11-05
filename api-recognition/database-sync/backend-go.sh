#!/bin/bash
config_file="database.env"
set -a; source $config_file; set +a

# echo $bg_user,$bg_pass,$bg_ip,$bg_port,$bg_program_path,$bg_dbname,$bg_dbuser,$bg_dbpass

sshpass -p $bg_dbpass ssh -p $bg_port $bg_user@$bg_ip "PGPASSWORD=$bg_dbpass pg_dump \
-U $bg_dbuser --format=custom -h localhost $bg_dbname" | \
PGPASSWORD=$local_dbpass pg_restore --clean -U $local_dbuser -d $local_dbname &
