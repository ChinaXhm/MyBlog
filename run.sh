#!/bin/bash

msg=":rocket: Deploying website `date '+%Y-%m-%d %H:%M:%S'`"


git pull origin master
git add .
if [ $# -eq 1 ]
    then msg="$1"
fi
	git commit -m "$msg"

git push




echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo --theme=m10c --baseUrl="https://ChinaXhm.github.io" --buildDrafts # if using a theme, replace with `hugo -t <YOURTHEME>`



# Go To Public folder
cd public

git pull origin master

# Add changes to git.
git add .

# Commit changes.

if [ $# -eq 1 ]
    then msg="$1"
fi
	git commit -m "$msg"

# Push source and build repos.
git push

# Come Back up to the Project Root