#!/bin/bash
for i in {1..300}
do
    curl -X POST -H "Content-Type: application/json" \
    -d '{"client_id":"Trial","user_image":"/rkbdev/facetablet/data/etoe_testing/images/'"$i"'.jpg"}' \
    http://127.0.0.1:3000/TrialFaceMask
done
