#! /bin/bash

echo -e "--------------------Deploy Begin --------------------"

git submodule update --remote --merge source/_posts
git submodule update --remote --merge themes/anzhiyu

echo -e "-------------------Step 1 Generate-------------------"

node link.js && hexo bangumi -u && hexo algolia

for i in {1..3}; do echo -e "\n" ; done

echo -e "-------------------Step 2 Update-------------------"

time=$(date "+%Y%m%d%H%M%S")

hexo clean
git add .
git commit -m "$time"
git push -u origin main

echo -e "-------------------Deploy End-------------------"

exec /bin/bash
