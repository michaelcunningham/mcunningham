. ./tmg.lib

all_hosts=$(get_prod_hosts)

for this_host in $all_hosts
do
  echo $this_host
done
