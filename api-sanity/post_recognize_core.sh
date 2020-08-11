#!/bin/bash

# hit recognizemask API Endpoint & output is saved to a .txt file
curl -X POST -H "Content-Type: application/json" -d @./public_html/payloads/recognize_core.json \
https://192.168.2.3:3000/TrialFaceMask > ./public_html/responses/recognize_core_result.json
