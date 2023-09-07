#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# CLUSTER_NAME can be something like mmdb and it will search for a container cluster that contains that in the name such as mmdb-tagged-pgbouncer
CLUSTER_NAME=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham
USER=postgres

########################################################################################################################
SQL_COMMAND="select cluster_name || '|' || task_name || '|' || region from aws.ecs_containers where container_name = 'pgbouncer' and cluster_name ~ '${CLUSTER_NAME}';"
this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")

this_cluster_name=$(echo $this_output | cut -d'|' -f1)
this_task_name=$(echo $this_output | cut -d'|' -f2)
this_region=$(echo $this_output | cut -d'|' -f3)
this_container_name=pgbouncer

CMD="aws ecs execute-command --region $this_region --command sh --interactive --cluster $this_cluster_name --task $this_task_name --container $this_container_name"
echo
echo "	############################################################"
echo
echo "	Executing command to open shell on $this_cluster_name"
echo
echo "	$CMD"
echo
echo "	############################################################"
echo

${CMD}

