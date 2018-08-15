#!/usr/bin/env bash

# Initialize variables
MB=100
counter=0

# Check for existence of .gitignore
for file in $(ls -a) 
do
  if [ "$file" = ".gitignore" ] 
  then
  	counter=$((counter+1))
  fi
done

# If no .gitignore create and add header, if exists overwrite with header
# Note that this section can be modified to append rather than overwrite if the .gitignore already exists
if [ $counter = 0 ]; 
then touch .gitignore
	echo "# First Line" > .gitignore
else
	echo "# First Line" > .gitignore
fi

# Append all files where size is > the threshold (in megabytes) set in the MB variable
find . -size +${MB}M | sed 's/^.//' | cat >> .gitignore
