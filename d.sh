#! /bin/bash

echo -e "--------------------Deploy Begin --------------------"

echo -e "-------------------Step 1 Generate-------------------"

hexo bangumi -u && hexo algolia && hexo clean 

for i in {1..3}; do echo -e "\n" ; done



echo -e "-------------------Step 2 Update-------------------"

time=$(date "+%Y%m%d%H%M%S")

git add .
git commit -m "$time"
git push -u origin main

for i in {1..3}; do echo -e "\n" ; done

echo -e "-------------------Deploy End-------------------"

exec /bin/bash
