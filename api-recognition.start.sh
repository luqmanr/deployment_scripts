#!/bin/bash
scriptdir="$(dirname "$0")"
exec $scriptdir/backend-go.start.sh && \
exec $scriptdir/core-fr.start.sh
