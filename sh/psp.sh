#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTANCE_GROUP=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham

SQL_COMMAND="select  i.hostname, i.port, d.database
from    pg.instances i, pg.standbys s, pg.databases d
where   i.instance_group = d.instance_group
and     i.instance_group = s.instance_group
and     i.instance = s.primary_instance
and     ( i.instance_group = '$INSTANCE_GROUP' or i.hostname ~ '$INSTANCE_GROUP' );"

########################################################################################################################
this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")

this_host=$(echo $this_output | cut -d'|' -f1)
this_port=$(echo $this_output | cut -d'|' -f2)
this_db=$(echo $this_output | cut -d'|' -f3)

echo
echo "	################################################################################"
echo
echo "	Connecting to primary database."
echo
echo "	HOST       = $this_host"
echo "	PORT       = $this_port"
echo "	DB         = $this_db"
echo
echo "	Executing  = psql -h $this_host -d $this_db -p $this_port -U mcunningham"
echo
echo "	################################################################################"
echo

psql -h $this_host -d $this_db -p $this_port -U mcunningham
