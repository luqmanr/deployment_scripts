#!/bin/bash
dbname=facetablet
dbuser=facever
dbpass=facever

pass="./rkb8.pass"
tables="./recognition-db_tables"

while IFS= read pass_line
do
    while IFS= read -r table_line
        do
            remotepass=$pass_line
            sshpass -p $remotepass ssh -p 25025 ubuntu@202.158.77.42 "PGPASSWORD=$dbpass pg_dump \
            -U $dbuser --format=custom -h localhost $dbname -t $table_line" | \
            PGPASSWORD=$dbpass pg_restore --clean -U $dbuser -d $dbname &
    done < "$tables"
done < "$pass"
