#!/bin/bash

msg=":rocket: Deploying website `date '+%Y-%m-%d %H:%M:%S'`"

# 先是将主目录文件提交上去, 方便两个人修改
git add .
git pull origin master
git add .
if [ $# -eq 1 ]
    then msg="$1"
fi
	git commit -m "$msg"
git push

# 再将public文件提交到github
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# Build the project.
hugo --theme=m10c --baseUrl="https://ChinaXhm.github.io" --buildDrafts # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
git pull origin master
git add .
if [ $# -eq 1 ]
    then msg="$1"
fi
	git commit -m "$msg"
git push