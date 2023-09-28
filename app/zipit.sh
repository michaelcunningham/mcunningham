#/bin/bash

this_dir=$(dirname "$0")

this_list=$(find $this_dir -type f -size +10M)

for this_file in $this_list
do
  echo "Zipping file: $this_file"
  gzip $this_file
done

