#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTANCE_GROUP=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham
USER=postgres

SQL_COMMAND="select  i.hostname
from    pg.instances i, pg.standbys s, pg.databases d
where   i.instance_group = d.instance_group
and     i.instance_group = s.instance_group
and     i.instance = s.primary_instance
and     i.instance_group = '$INSTANCE_GROUP';"

SQL_COMMAND="select  hostname
from    pg.host_instances
where   ( instance_group = '$INSTANCE_GROUP' or hostname ~ '$INSTANCE_GROUP' )
and     is_primary = true;"

########################################################################################################################
echo
echo $SQL_COMMAND
echo

this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")

this_host=$(echo $this_output | cut -d'|' -f1)

echo
echo "	############################################################"
echo
echo "	ssh to primary server for $INSTANCE_GROUP"
echo
echo "	HOST = $this_host"
echo
echo "	Executing: ssh -l mcunningham $this_host"
echo
echo "	############################################################"
echo

ssh -l mcunningham $this_host
