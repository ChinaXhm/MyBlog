REM #!/bin/bash

msg=":rocket: Deploying website `date '+%Y-%m-%d %H:%M:%S'`"

REM # 先是将主目录文件提交上去, 方便两个人修改
git pull origin master
git add .
	git commit -m "提交"
git push

REM # 再将public文件提交到github
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
REM # Build the project.
hugo --theme=m10c --baseUrl="https://ChinaXhm.github.io" --buildDrafts REM # if using a theme, replace with `hugo -t <YOURTHEME>`

REM # Go To Public folder
cd public
git pull origin master
git add .
if [ $# -eq 1 ]
    then msg="$1"
fi
	git commit -m "$msg"
git push
