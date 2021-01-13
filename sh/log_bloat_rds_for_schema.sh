#!/bin/bash

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $SCRIPT_PATH/functions.lib

########################################################################################################################
get_popgun_info

this_ig=$1
this_db=$2
this_schema=$3

DT=$(date "+%Y-%m-%d %H:%M:%S")
DT=$(get_current_timestamp)
sql_file_tables=$SCRIPT_PATH/table_bloat.sql
sql_file_indexes=$SCRIPT_PATH/index_bloat.sql
csv_file_tables=$SCRIPT_PATH/table_bloat.csv
csv_file_indexes=$SCRIPT_PATH/index_bloat.csv

> $csv_file_tables
> $csv_file_indexes

export PGCONNECT_TIMEOUT=5

IG=${this_ig}

# Override for testing
# ig_list="popgundb.use1.amz.mtmeprod.com"

psql -AXt -h $IG -d $this_db -p $PORT -U postgres -f $sql_file_tables --set ig="'${IG}'" --set dt="'${DT}'" --set schema="'${this_schema}'" >> $csv_file_tables
psql -AXt -h $IG -d $this_db -p $PORT -U postgres -f $sql_file_indexes --set ig="'${IG}'" --set dt="'${DT}'" --set schema="'${this_schema}'" >> $csv_file_indexes

psql -h $HOST -d $DB -p $PORT -U $USER -c "\copy public.dba_hist_table_bloat from '$csv_file_tables' csv;"
psql -h $HOST -d $DB -p $PORT -U $USER -c "\copy public.dba_hist_index_bloat from '$csv_file_indexes' csv;"

