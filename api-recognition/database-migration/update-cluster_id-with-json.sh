#!/bin/bash
target_cluster='riset-ai'
client_id='riset-ai'
jq -r -c '.user_id_rkb[]' './user_id_rkb.json' | while read i; do
    for user_id_rkb in $i; do
        PGPASSWORD=facever psql -U facever -d facetablet -c \
        "UPDATE recog_user SET cluster_id = '$target_cluster'
        WHERE user_id_rkb = '$user_id_rkb'
        AND client_id = '$client_id';"
    done
done