#!/bin/bash
${BASH_SOURCE%/*}/backend-go-liveness.start.sh && \
${BASH_SOURCE%/*}/core-liveness.start.sh
