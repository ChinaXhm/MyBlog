git pull origin master
git add .
git commit -m "commit"
git push
hugo --theme=m10c --baseUrl="https://ChinaXhm.github.io" --buildDrafts
cd public
git pull origin master
git add .
git commit -m "commit"
git push
