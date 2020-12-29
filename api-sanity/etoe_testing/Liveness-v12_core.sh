#!/bin/bash
for i in {1..300}
do
    curl -X POST -H "Content-Type: application/json" \
    -d '{"pattern":"left","user_image":"/rkbdev/demo-peruri/etoe_testing/images/'"$i"'.jpg"}' \
    http://127.0.0.1:5000/LivenessVerification/v1.2/
done
