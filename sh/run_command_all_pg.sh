#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham

SQL=${1}

########################################################################################################################
SQL_COMMAND="select hostname from pg.hostnames order by hostname;"

psql -AXtq -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND" | xargs -I {} sh -c "echo {}; psql -h {} production mcunningham -c '${SQL}'"

