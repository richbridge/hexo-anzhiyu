#! /bin/bash

echo -e "\033[31;40m--------------------Deploy Begin --------------------"

echo -------------------Step 1 Generate-------------------

cd ../hexo/
hexo clean && hexo algolia

for i in {1..3}; do echo -e "\n" ; done



echo -e "-------------------Step 2 Update-------------------"

git add .
read -p "Input the git commit content:    " content
git commit -m "$content"
git push -u origin main

for i in {1..3}; do echo -e "\n" ; done

echo -e "-------------------Deploy End-------------------"

exec /bin/bash
