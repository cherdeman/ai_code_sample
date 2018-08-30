# Infrastructure Files
Last Updated: August 28, 2018  
Languages: Bash, Markdown

## Description
AI had an issue with excessively large files being committed to Gitlab repositories. These scripts are two options to build in safeguards to prevent large file commits.

## Files
* **ignore.sh**: Automatically creates a gitignore and adds all files above a certain size threshold.
* **pre-commit-hook.Md**: Instructions on how to install a pre-commit hook that rejects files above a certain size threshold.
