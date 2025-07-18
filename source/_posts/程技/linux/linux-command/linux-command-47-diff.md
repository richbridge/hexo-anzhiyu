---
title: '每天一个linux命令（47）: diff'
date: 2017-01-15 14:08:08
type: posts
cover: https://jsd.cdn.zzko.cn/gh/richbridge/picx-images-hosting@master/thumbnail/程技.jpg
categories: [程技]
tags: ["linux命令"]
---
　　diff 命令是 linux上非常重要的工具，用于比较文件的内容，特别是比较两个版本不同的文件以找到改动的地方。diff在命令行中打印每一个行的改动。最新版本的diff还支持二进制文件。diff程序的输出被称为补丁 (patch)，因为Linux系统中还有一个patch程序，可以根据diff的输出将a.c的文件内容更新为b.c。diff是svn、cvs、git等版本控制工具不可或缺的一部分。
<!--more -->
#### 命令格式
```bash
$ diff [参数] [文件1或目录1] [文件2或目录2]
```
#### 命令功能
　　diff命令能比较单个文件或者目录内容。如果指定比较的是文件，则只有当输入为文本文件时才有效。以逐行的方式，比较文本文件的异同处。如果指定比较的是目录的的时候，diff 命令会比较两个目录下名字相同的文本文件。列出不同的二进制文件、公共子目录和只在一个目录出现的文件。

#### 命令参数
| 参数 | 描述 |
| :- | :- |
| - | 指定要显示多少行的文本。此参数必须与-c或-u参数一并使用 |
| -a或--text | diff预设只会逐行比较文本文件 |
| -b或--ignore-space-change | 不检查空格字符的不同 |
| -B或--ignore-blank-lines | 不检查空白行 |
| -c | 显示全部内文，并标出不同之处 |
| -C或--context | 与执行"-c"指令相同 |
| -d或--minimal | 使用不同的演算法，以较小的单位来做比较 |
| -D或ifdef | 此参数的输出格式可用于前置处理器巨集 |
| -e或--ed | 此参数的输出格式可用于ed的script文件 |
| -f或-forward-ed | 输出的格式类似ed的script文件，但按照原来文件的顺序来显示不同处 |
| -H或--speed-large-files | 比较大文件时，可加快速度 |
| -l或--ignore-matching-lines | 若两个文件在某几行有所不同，而这几行同时都包含了选项中指定的字符或字符串，则不显示这两个文件的差异 |
| -i或--ignore-case | 不检查大小写的不同 |
| -l或--paginate | 将结果交由pr程序来分页 |
| -n或--rcs | 将比较结果以RCS的格式来显示 |
| -N或--new-file | 在比较目录时，若文件A仅出现在某个目录中，预设会显示：Only in目录：文件A若使用-N参数，则diff会将文件A与一个空白的文件比较 |
| -p | 若比较的文件为C语言的程序码文件时，显示差异所在的函数名称 |
| -P或--unidirectional-new-file | 与-N类似，但只有当第二个目录包含了一个第一个目录所没有的文件时，才会将这个文件与空白的文件做比较 |
| -q或--brief | 仅显示有无差异，不显示详细的信息 |
| -r或--recursive | 比较子目录中的文件 |
| -s或--report-identical-files | 若没有发现任何差异，仍然显示信息 |
| -S或--starting-file | 在比较目录时，从指定的文件开始比较 |
| -t或--expand-tabs | 在输出时，将tab字符展开 |
| -T或--initial-tab | 在每行前面加上tab字符以便对齐 |
| -u,-U或--unified= | 以合并的方式来显示文件内容的不同 |
| -v或--version | 显示版本信息 |
| -w或--ignore-all-space | 忽略全部的空格字符 |
| -W或--width | 在使用-y参数时，指定栏宽 |
| -x或--exclude | 不比较选项中所指定的文件或目录 |
| -X或--exclude-from | 您可以将文件或目录类型存成文本文件，然后在=中指定此文本文件 |
| -y或--side-by-side | 以并列的方式显示文件的异同之处 |
| --left-column | 在使用-y参数时，若两个文件某一行内容相同，则仅在左侧的栏位显示该行内容 |
| --suppress-common-lines | 在使用-y参数时，仅显示不同之处 |
| --help | 显示帮助 |

#### 使用实例
**`例一`：比较两个文件**
```bash
$ diff 1.txt 2.txt
1c1
< ii
---
> iii
```
>**说明：**
　　上面的“1c1”表示第一个文件和第二个文件的第1行内容有所不同；
　　diff 的normal 显示格式有三种提示:
　　　　a - add
　　　　c - change
　　　　d - delete

**`例二`：并排格式输出**
```bash
$ diff 1.txt 2.txt -y -W 50
ii		      |	iii
iii			      iii
iiii			    iiii
iiiii			    iiiii
```
>**说明：**
　　“|”表示前后2个文件内容有不同
　　“<”表示后面文件比前面文件少了1行内容
　　“>”表示后面文件比前面文件多了1行内容

**`例三`：上下文输出格式**
```bash
$ diff 1.txt 2.txt  -c
*** 1.txt	2017-01-28 14:24:13.744538252 +0800
--- 2.txt	2017-01-28 14:24:59.096124066 +0800
***************
*** 1,4 ****
! ii
  iii
  iiii
  iiiii
--- 1,4 ----
! iii
  iii
  iiii
  iiiii
```
>**说明：**
　　这种方式在开头两行作了比较文件的说明，这里有三中特殊字符：
　　“＋” 比较的文件的后者比前着多一行
　　“－” 比较的文件的后者比前着少一行
　　“！” 比较的文件两者有差别的行

**`例四`：统一格式输出**
```bash
$ diff 1.txt 2.txt  -u
--- 1.txt	2017-01-28 14:24:13.744538252 +0800
+++ 2.txt	2017-01-28 14:24:59.096124066 +0800
@@ -1,4 +1,4 @@
-ii
+iii
 iii
 iiii
 iiiii
```
**`例五`：比较文件夹不同**
```bash
$ diff test3 test6
```
**`例六`：比较两个文件不同，并生产补丁**
```bash
$ diff -ruN 1.txt 2.txt >patch.log
```
**`例七`：打补丁**
```bash
$ 1.txt patch
```
