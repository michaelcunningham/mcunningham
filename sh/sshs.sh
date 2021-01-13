#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTANCE_GROUP=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham

SQL_COMMAND="select  i.hostname
from    pg.instances i, pg.standbys s, pg.databases d
where   i.instance_group = d.instance_group
and     i.instance_group = s.instance_group
and     i.instance = s.standby_instance
and     i.instance_group = '$INSTANCE_GROUP';"

########################################################################################################################
this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")

this_host=$(echo $this_output | cut -d'|' -f1)

echo
echo "	############################################################"
echo
echo "	ssh to standby server for $INSTANCE_GROUP"
echo
echo "	HOST = $this_host"
echo
echo "	############################################################"
echo

ssh -l mcunningham $this_host
