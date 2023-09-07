# This script accepts one parameter - schema_name
# Then traverses all prod databases to find which database the schema exists in.

if [ "$1" = "" ]
then
  echo
  echo "   Usage: $0 <schema_name>"
  echo
  echo "   Example: $0 notes"
  echo
  exit
fi

. ./tmg.lib

this_schema=$1
all_hosts=$(get_prod_hosts)
is_found=false

SQL="select nspname as schemaname from pg_catalog.pg_namespace where nspname = '$this_schema'"
echo $SQL

echo
echo "	################################################################################"
echo
echo "	Searching for the $this_schema schema..."
echo

for this_host in $all_hosts
do
  results=$(psql -X -t -h ${this_host} -d production -U mcunningham -c "${SQL}")
  if [ ! -z $results ]
  then
    echo
    echo "	The $this_schema schema was found in the instance: $this_host"
    echo
    is_found=true
  fi
done

if [ $is_found = "false" ]
then
  echo "	The $this_schema schema could not be found"
  echo
fi

echo "	################################################################################"
echo

