#!/usr/bin/env bash

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
if [ $counter = 0 ]; 
then touch .gitignore
	echo "# First Line" > .gitignore
else
	echo "# First Line" > .gitignore
fi

# Append all files where size is > 100M
find . -size +100M | sed 's/^.//' | cat >> .gitignore
