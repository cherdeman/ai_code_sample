# AI Code Sample
Code sample from internship, summer 2018. Note that the name of the organization is not recorded here to avoid any mistaken association between the code and results contained in this repository and those of the organization itself.

## Meta-Analysis
This directory contains a simplified sample meta-analysis that is similar to work done at AI. The goal of this type of analysis is to aggregate results of a number of experiments to understand general results. Since AI's data is proprietary and private, the data used in this analysis is randomly generated and should not be used to draw conclusions. Code that is drawn from AI's codebase is cited.

## Infrastructure
This directory contains scripts aiming to provide a safeguard against accidentally committing large files to a Gitlab repository. It includes two documents:

* **ignore.sh**: A bash script that autimatically generates a gitignore file and adds all files above a specified size limit
* **pre-commit-hook.Md**: A markdown document with instructions to install a pre-commit hook that rejects a commit with files above a specified size limit
