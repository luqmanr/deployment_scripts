#!/bin/bash
config_file="database.env"
set -a; source $config_file; set +a

echo $bg_user