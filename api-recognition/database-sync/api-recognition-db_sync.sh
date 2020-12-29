#!/bin/bash
"${BASH_SOURCE%/*}/recognition-postgres_sync.sh"
"${BASH_SOURCE%/*}/recognition-core-db_sync.sh"

return 0