#!/bin/bash

# hit recognizemask API Endpoint & output is saved to a .txt file
curl -X POST -H "Content-Type: application/json" -d @./public_html/payloads/fail.json \
https://riset.luqmanr.xyz/api_fr/v2/recognizemask > ./public_html/responses/recognize_result.json
