#! /bin/bash

echo -e "-------------------- 开始部署 --------------------"

git submodule update --remote --merge source/_posts
git submodule update --remote --merge source/img
# git submodule update --remote --merge themes/anzhiyu

echo -e "------------------- 子模块更新完成 -------------------"

hexo clean # hexo bangumi -u && hexo clean

for i in {1..2}; do echo -e "\n" ; done

echo -e "------------------- 番号页和搜索页完成 -------------------"

time=$(date "+%Y%m%d%H%M%S")

git add .
git commit -m "$time"
git push -u origin main

echo -e "------------------- 上传完成 -------------------"

exec /bin/bash
