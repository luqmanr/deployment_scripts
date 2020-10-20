#!/bin/bash
target_cluster='riset-ai'
client_id='riset-ai'
while IFS=, read -r user_id_rkb cluster_id
do
    [[ "$user_id_rkb" != "user_id_rkb" ]] && \ ## skip header
    PGPASSWORD=facever psql -U facever -d facetablet -c \
    "UPDATE recog_user SET cluster_id = '$target_cluster'
    WHERE user_id_rkb = '$user_id_rkb'
    AND client_id = '$client_id';"
done < ./user_id_rkb.csv