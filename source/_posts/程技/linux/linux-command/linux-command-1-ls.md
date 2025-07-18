---
title: '每天一个linux命令（1）: ls'
date: 2016-12-01 09:38:59
type: posts
cover: https://jsd.cdn.zzko.cn/gh/richbridge/picx-images-hosting@master/thumbnail/程技.jpg
categories: [程技]
tags: ["linux命令"]
---
　　ls命令是linux下最常用的命令。ls命令就是list的缩写，缺省下ls用来打印出当前目录的清单，如果ls指定其他目录，那么就会显示指定目录里的文件及文件夹清单。 通过ls命令不仅可以查看linux文件夹包含的文件，而且可以查看文件权限(包括目录、文件夹、文件权限)、查看目录信息等等。ls命令在日常的linux操作中用的很多!
<!--more -->
#### 命令格式
```shell
$ ls [选项] [目录名]
```
#### 命令功能
列出目标目录中所有的子目录和文件。
#### 常用参数
| 参数     | 说明     |
| :------------- | :------------- |
| -a,--all       | 列出目录下的所有文件，包括以 . 开头的隐含文件      |
|  -A  |  同-a，但不列出“.”(表示当前目录)和“..”(表示当前目录的父目录)。  |
|  -c  配合 -lt  |  根据 ctime 排序及显示 ctime (文件状态最后更改的时间)配合 -lt：显示 ctime 但根据名称排序否则：根据 ctime 排序  |
|  -C  |  每栏由上至下列出项目  |
|  -color[=WHEN]  |  控制是否使用色彩分辨文件。WHEN 可以是'never'、'always'或'auto'其中之一  |
|  -d,--directory  |  将目录象文件一样显示，而不是显示其下的文件。  |
|  -D,--dired  |  产生适合 Emacs 的 dired 模式使用的结果  |
|  -f  |  对输出的文件不进行排序，-aU 选项生效，-lst 选项失效  |
|  -g  |  类似 -l,但不列出所有者  |
|  -G, --no-group  |  不列出任何有关组的信息  |
|  -h,--human-readable  |  以容易理解的格式列出文件大小 (例如 1K 234M 2G)  |
|  --si  |  类似 -h,但文件大小取 1000 的次方而不是 1024  |
|  -H, --dereference-command-line  |  使用命令列中的符号链接指示的真正目的地 |
|  --indicator-style=<方式>  |  指定在每个项目名称后加上指示符号<方式>：none (默认)，classify (-F)，file-type (-p)  |
|  -i, --inode  |   印出每个文件的 inode 号  |
|  -I,--ignore=样式   |  不印出任何符合 shell 万用字符<样式>的项目  |
|  -k  |  即 –block-size=1K,以 k 字节的形式表示文件的大小  |
|  -l  |  除了文件名之外，还将文件的权限、所有者、文件大小等信息详细列出来。  |
|  -L, --dereference  |    |
|  -m  |  所有项目以逗号分隔，并填满整行行宽  |
|  -o  |  类似 -l,显示文件的除组信息外的详细信息。  |
|  -r, --reverse  | 依相反次序排列   |
|  -R, --recursive  |  同时列出所有子目录层  |
|  -s,--size  |  以块大小为单位列出所有文件的大小  |
|  -S  |  根据文件大小排序  |
|  --sort=WORD  |  可选用的 WORD 和它们代表的相应选项： <br>extension -X status -c<br>none -U time -t<br>size -S atime -u<br>time -t access -u<br>version -v use -u |
|  -t  |  以文件修改时间排序  |
|  -u   |  配合 -lt:显示访问时间而且依访问时间排序<br>配合 -l:显示访问时间但根据名称排序<br>否则：根据访问时间排序  |
|  -U  |  不进行排序;依文件系统原有的次序列出项目  |
|  -v  |  根据版本进行排序  |
|  -w, --width=COLS  |   自行指定屏幕宽度而不使用目前的数值  |
|  -x  |  逐行列出项目而不是逐栏列出  |
|  -X  |  根据扩展名排序  |
|  -1  |  每行只列出一个文件  |
|  --help  |  显示此帮助信息并离开  |
|  --version   |  显示版本信息并离开  |
#### 常用范例
**`例一`：列出/home/faker/ 文件夹下的所有文件和目录的详细资料**
```bash
$ ls -l -R /home/faker
$ ls -lR /home/faker
```
**`例二`：列出当前目录中所有以“t”开头的目录的详细内容，可以使用如下命令**
```bash
$ ls -l t*
```
**`例三`：只列出文件下的子目录**
```bash
$ ls -F /opt/soft |grep /$
```
**`例四`：列出文件下的子目录详细情况**
```bash
$ ls -l /opt/soft | grep "^d"
```
**`例五`：列出目前工作目录下所有名称是s 开头的文件，愈新的排愈后面，可以使用如下命令**
```bash
$ ls -ltr s*
```
**`例六`：列出目前工作目录下所有档案及目录;目录于名称后加"/", 可执行档于名称后加`*`**
```bash
$ ls -AF
```
**`例七`：计算当前目录下的文件数和目录数**
```bash
$ ls -l * |grep "^-"|wc -l    ---文件个数
$ ls -l * |grep "^d"|wc -l    ---目录个数
```
**`例八`：在ls中列出文件的绝对路径**
```bash
$ ls | sed "s:^:`pwd`/:"
```
**`例九`：列出当前目录下的所有文件（包括隐藏文件）的绝对路径， 对目录不做递归**
```bash
$ find $PWD -maxdepth 1 | xargs ls -ld
```
**`例十`：列出当前目录下的所有文件（包括隐藏文件）的绝对路径， 对目录不做递归**
```bash
$ find $PWD -maxdepth 1 | xargs ls -ld
```
**`例十`：递归列出当前目录下的所有文件（包括隐藏文件）的绝对路径**
```bash
$ find $PWD | xargs ls -ld
```
**`例十`：指定文件时间输出格式**
```bash
$ ls -tl --time-style=full-iso
$ ls -ctl --time-style=long-iso
```
```bash
2016-08-05 22:17:06.020535551 +0800
2016-10-29 12:03
```
