# Adding the Pre-Commit Hook for Large Files to Your Repo #

This markdown is intended to provide instruction on how to implement a pre-commit hook to prevent the addition of large files to AI git repositories. Git hooks are not shared across repositories or by different users of the same repository, so each user will need to run through these steps for each newly cloned or existing repository. After these steps are successfully completed, this script will execute every time the git commit command is run. 

## Setup Instructions ##

#### Navigate to the standard hooks directory

From the root of a repository, run the command: `cd .git/hooks/`

#### Create a "pre-commit" hook

* Create and open an empty file called "pre-commit" with *NO* extension 
* Copy and paste the following code block into the empty file:  

```
#!/usr/bin/env bash

# credit to https://gist.github.com/nickjacob/5a0c56ba451a6892ff14#file-pre-commit-sh

# Set size limit for files, the MB variable holds the size threshold in megabytes
MB=100
SIZE_LIMIT=$(( 1048576 * ${MB} ))

# echo "running pre-commit hook..."
for file in $(git status -uno --porcelain)
do
# Get file size
if [ ${#file} -gt 1 -a -f "$file" ]
then
  __ln=( $( ls -Lon "$file" ) )
  __size=${__ln[3]}

# Find files that exceed size limit, if so unstage and stop commit
  if [ $__size -ge $SIZE_LIMIT ]
  then
    echo "$file is larger than ${MB}MB. please don't add to repo"
    git reset HEAD $file
    exit 1;
  fi

fi
done
# echo "finished running pre-commit hook"
```

* Save the file

#### Make the pre-commit hook executable

While still in the .git/hooks directory, run: `chmod +x pre-commit`  

Done! Return to the root directory (run: `cd ../..`) and proceed as usual. 

## Usage Instructions ##

If properly configured, this hook will automatically run when a git commit is initiated.

## Testing Instructions ##

To test whether this script is running without testing a large file, alter the pre-commit hook by uncommenting the lines beginning with  `echo` before and after the body of the script. You should not need to run the `chmod` command a second time. Now the text "running pre-commit hook..." and "finished running pre-commit hook" will print to the terminal during each commit. Delete/comment out the lines to return to the quiet version of the script. 

## Notes:
* This script sets the size limit for files at 100 MB. To alter that threshold, alter the value of the MB variable.
* This script is designed to ignore untracked files in the `git status` command, but it is still good practice to add a file to a .gitignore if it is above the size threshold.
