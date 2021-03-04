#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTANCE_GROUP=$1

HOST=popgundb.use1.amz.mtmeprod.com
PORT=5432
DB=pg
USER=mcunningham

SQL_COMMAND="select  instance_id, case when position( '. ' in cname ) > 0 then substring( cname, 1, position( '. ' in cname )-1 ) else case when cname = '' then endpoint else cname end end as endpoint,
        instance_class as class, engine, engine_version as version, is_writer
from    aws.rds_instances
where   engine in( 'postgres', 'aurora-postgresql' )
and     status not in( 'stopped' )
order by instance_id;"

########################################################################################################################
psql -X -h $HOST -d $DB -p $PORT -U $USER -c "$SQL_COMMAND"

