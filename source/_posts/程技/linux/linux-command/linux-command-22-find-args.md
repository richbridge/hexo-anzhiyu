---
title: '每天一个linux命令（22）: find命令的参数详解'
date: 2016-12-22 11:44:14
type: posts
cover: https://jsd.cdn.zzko.cn/gh/richbridge/picx-images-hosting@master/thumbnail/程技.jpg
categories: [程技]
tags: ["linux命令"]
---
　　find一些常用参数的一些常用实例和一些具体用法和注意事项。
<!--more -->
#### 使用name选项
　　文件名选项是find命令最常用的选项，要么单独使用该选项，要么和其他选项一起使用。可以使用某种文件名模式来匹配文件，记住要用引号将文件名模式引起来。
```bash
## 在自己的根目录$HOME中查找文件名符合*.log的文件，使用~作为 'pathname'参数，波浪号~代表了你的$HOME目录。
$ find ~ -name "*.log" -print

## 在当前目录及子目录中查找所有的‘ *.log‘文件
$ find . -name "*.log" -print

## 当前目录及子目录中查找文件名以一个大写字母开头的文件
$ find . -name "[A-Z]*" -print

## 在/etc目录中查找文件名以host开头的文件
$ find /etc -name "host*" -print

## 想要查找$HOME目录中的文件
$ find ~ -name "*" -print
$ find . -print

## 让系统高负荷运行，就从根目录开始查找所有的文件
$ find / -name "*" -print

## 在当前目录查找文件名以一个个小写字母开头，最后是4到9加上.log结束的文件
$ find . -name "[a-z]*[4-9].log" -print
```

#### 用perm选项
　　按照文件权限模式用-perm选项,按文件权限模式来查找文件的话。最好使用八进制的权限表示法
```bash
## 在当前目录下查找文件权限位为755的文件
$ find . -perm 755 -print
```
　　还有一种表达方法：在八进制数字前面要加一个横杠-，表示都匹配，如-007就相当于777，-005相当于555,
```bash
$ find . -perm -005
```

#### 忽略某个目录
　　如果在查找文件时希望忽略某个目录，因为你知道那个目录中没有你所要查找的文件，那么可以使用-prune选项来指出需要忽略的目录。在使用-prune选项时要当心，因为如果你同时使用了-depth选项，那么-prune选项就会被find命令忽略。如果希望在test目录下查找文件，但不希望在test/test3目录下查找，可以用:
```bash
$ find test -path "test/test3" -prune -o -print
```
#### 使用find查找文件的时候怎么避开某个文件目录
**`例一`：在test 目录下查找不在test4子目录之内的所有文件**
```bash
$ find test -path "test/test4" -prune -o -print
```
>**说明：**
find [-path ..] [expression]
在路径列表的后面的是表达式
-path "test" -prune -o -print 是 -path "test" -a -prune -o -print 的简写表达式按顺序求值, -a 和 -o 都是短路求值，与 shell 的 && 和 || 类似如果
-path "test" 为真，则求值 -prune , -prune 返回真，与逻辑表达式为真；否则不求值 -prune，与逻辑表达式为假。如果 -path "test" -a -prune 为假，则求值 -print ，-print返回真，或逻辑表达式为真；否则不求值 -print，或逻辑表达式为真。
这个表达式组合特例可以用伪码写为:
if -path "test" then  
-prune  
else  
-print  

**`例二`：避开多个文件夹**
```bash
## 圆括号表示表达式的结合。\ 表示引用，即指示 shell 不对后面的字符作特殊解释，而留给 find 命令去解释其意义
$ find test \( -path test/test4 -o -path test/test3 \) -prune -o -print
```
**`例三`：查找某一确定文件，-name等选项加在-o 之后**
```bash
$ find test \(-path test/test4 -o -path test/test3 \) -prune -o -name "*.log" -print
```
#### 使用user和nouser选项
```bash
## 在$HOME目录中查找文件属主为peida的文件
$ find ~ -user peida -print

## 在/etc目录下查找文件属主为peida的文件
$ find /etc -user peida -print

## 为了查找属主帐户已经被删除的文件，可以使用-nouser选项。在/home目录下查找所有的这类文件
$ find /home -nouser -print
```
#### 使用group和nogroup选项
```bash
## 在/apps目录下查找属于gem用户组的文件
$ find /apps -group gem -print

## 查找没有有效所属用户组的所有文件
$ find / -nogroup-print

```
#### 按照更改时间或访问时间等查找文件
　　如果希望按照更改时间来查找文件，可以使用mtime,atime或ctime选项。如果系统突然没有可用空间了，很有可能某一个文件的长度在此期间增长迅速，这时就可以用mtime选项来查找这样的文件。  
用减号`-`来限定更改时间在距今n日以内的文件，而用加号`+`来限定更改时间在距今n日以前的文件
```bash
## 在系统根目录下查找更改时间在5日以内的文件
$ find / -mtime -5 -print

## 在/var/adm目录下查找更改时间在3日以前的文件
$ find /var/adm -mtime +3 -print
```
#### 查找比某个文件新或旧的文件
　　如果希望查找更改时间比某个文件新但比另一个文件旧的所有文件，可以使用-newer选项。
```bash
## 查找更改时间比文件log2012.log新但比文件log2017.log旧的文件
$ find -newer log2012.log ! -newer log2017.log

## 查找更改时间在比log2012.log文件新的文件
$ find . -newer log2012.log -print

```
#### 使用type选项
```bash
## 在/etc目录下查找所有的目录
$ find /etc -type d -print

## 在当前目录下查找除目录以外的所有类型的文件
$ find . ! -type d -print

## 在/etc目录下查找所有的符号链接文件
$ find /etc -type l -print
```
#### 使用size选项
　　可以按照文件长度来查找文件，这里所指的文件长度既可以用块（block）来计量，也可以用字节来计量。以字节计量文件长度的表达形式为N c；以块计量文件长度只用数字表示即可。  
在按照文件长度查找文件时，一般使用这种以字节表示的文件长度，在查看文件系统的大小，因为这时使用块来计量更容易转换。
```bash
## 在当前目录下查找文件长度大于1 M字节的文件
$ find . -size +1000000c -print

## 在/home/apache目录下查找文件长度恰好为100字节的文件
$ find /home/apache -size 100c -print

## 在当前目录下查找长度超过10块的文件（一块等于512字节）
$ find . -size +10 -print
```
#### 使用depth选项
　　在使用find命令时，可能希望先匹配所有的文件，再在子目录中查找。使用depth选项就可以使find命令这样做。这样做的一个原因就是，当在使用find命令向磁带上备份文件系统时，希望首先备份所有的文件，其次再备份子目录中的文件。
```bash
## find命令从文件系统的根目录开始，查找一个名为CON.FILE的文件
## 它将首先匹配所有的文件然后再进入子目录中查找
$ find / -name "CON.FILE" -depth -print
```
#### 使用mount选项
　　在当前的文件系统中查找文件（不进入其他文件系统），可以使用find命令的mount选项
```bash
## 从当前目录开始查找位于本文件系统中文件名以XC结尾的文件
$ find . -name "*.XC" -mount -print
```
