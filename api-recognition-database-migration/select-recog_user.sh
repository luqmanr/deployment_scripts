#!/bin/bash
PGPASSWORD=facever psql -U facever -d facetablet -c "select * from recog_user;"