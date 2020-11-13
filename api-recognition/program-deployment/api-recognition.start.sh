#!/bin/bash
${BASH_SOURCE%/*}/backend-go.start.sh && \
${BASH_SOURCE%/*}/core-fr.start.sh
