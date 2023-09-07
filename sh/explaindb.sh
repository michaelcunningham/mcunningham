#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTANCE_GROUP=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham

########################################################################################################################
SQL_COMMAND="select  hi.hostname, i.port, d.database, s.primary_instance
from    pg.host_instances hi, pg.instances i, pg.standbys s, pg.databases d
where   i.instance_group = d.instance_group
and     i.instance_group = s.instance_group
and     hi.hostname = i.hostname
and     hi.is_primary = true
and     hi.instance_group = '$INSTANCE_GROUP';"

this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")

this_host=$(echo $this_output | cut -d'|' -f1)
this_port=$(echo $this_output | cut -d'|' -f2)
this_db=$(echo $this_output | cut -d'|' -f3)
this_instance_name=$(echo $this_output | cut -d'|' -f4)
this_host_short=$(echo $this_host | cut -d'.' -f1)
this_host_managed_by=$(curl -s "https://kickstart-api.tagged.com/hosts?filter=hostname=${this_host_short}&pipe=management")

echo
echo "	##########################################################################################"
echo
echo "	Primary database."
echo
echo "	HOST            = $this_host"
echo "	PORT            = $this_port"
echo "	DB              = $this_db"
echo "	INSTANCE_NAME   = $this_instance_name"
echo "	SSH             = ssh -l mcunningham $this_host"
echo "	PSQL            = psql -h $this_host -p $this_port -d $this_db -U mcunningham"
echo "	Host Managed By = $this_host_managed_by"
echo
# echo "	##########################################################################################"
echo "	------------------------------------------------------------------------------------------"
echo

########################################################################################################################
SQL_COMMAND="select  hi.hostname, i.port, d.database, s.standby_instance
from    pg.host_instances hi, pg.instances i, pg.standbys s, pg.databases d
where   i.instance_group = d.instance_group
and     i.instance_group = s.instance_group
and     hi.hostname = i.hostname
and     i.instance = s.standby_instance
and     hi.is_standby = true
and     hi.instance_group = '$INSTANCE_GROUP';"

this_output=$(psql -AXt -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND")

for this_item in $this_output
do
  this_host=$(echo $this_item | cut -d'|' -f1)
  this_port=$(echo $this_item | cut -d'|' -f2)
  this_db=$(echo $this_item | cut -d'|' -f3)
  this_instance_name=$(echo $this_item | cut -d'|' -f4)
  this_host_short=$(echo $this_host | cut -d'.' -f1)
  this_host_managed_by=$(curl -s "https://kickstart-api.tagged.com/hosts?filter=hostname=${this_host_short}&pipe=management")

  echo "	Standby database."
  echo
  echo "	HOST            = $this_host"
  echo "	PORT            = $this_port"
  echo "	DB              = $this_db"
  echo "	INSTANCE_NAME   = $this_instance_name"
  echo "	SSH             = ssh -l mcunningham $this_host"
  echo "	PSQL            = psql -h $this_host -p $this_port -d $this_db -U mcunningham"
  echo "	Host Managed By = $this_host_managed_by"
  echo
done

echo
echo "	##########################################################################################"
echo
