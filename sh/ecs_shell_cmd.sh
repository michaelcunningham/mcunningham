#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CLUSTER_NAME_LIKE=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham
USER=postgres

SQL_COMMAND="select  cluster_name, task_name, container_name, region
from    aws.ecs_containers
where   cluster_name ~ 'mmdb';"

########################################################################################################################
#echo
#echo $SQL_COMMAND
#echo

echo
echo "	################################################################################"
echo
echo "	Use the following command(s) to create a shell into a pgbouncer container"
echo
this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")
for this_item in $this_output
do
  echo
  this_cluster_name=$(echo $this_item | cut -d'|' -f1)
  this_task_name=$(echo $this_item | cut -d'|' -f2)
  this_container_name=$(echo $this_item | cut -d'|' -f3)
  this_region=$(echo $this_item | cut -d'|' -f4)
  echo "	aws ecs execute-command --profile $AWS_PROFILE --region $this_region --command sh --interactive --cluster $this_cluster_name --task $this_task_name --container $this_container_name"
  echo
done

echo
echo "	################################################################################"
echo

