#/bin/bash

this_dir=$(dirname "$0")

this_list=$(find $this_dir -name "*.gz")

for this_file in $this_list
do
  echo "Zipping file: $this_file"
  gunzip -k $this_file
done

