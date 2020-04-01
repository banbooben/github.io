---
title: wc命令
comments: true
mathjax: true
date: 2020-04-01 12:16:01
tags: wc
categories: Linux
top:
false cover:
false password:
summary:
---

利用wc指令我们可以计算文件的Byte数、字数、或是列数，若不指定文件名称、或是所给予的文件名为"-"，则wc指令会从标准输入设备读取数据。

#### 语法

```shell
wc [-clw][--help][--version][文件...]
```



#### 参数

```shell
# 参数解读
    # -c 显示Bytes数
    # -l 显示行数
    # -w 显示字数
    # --help 在线帮助
    # --version 显示版本

```



#### 示例

```shell
# 示例
wc demo.csv
#		行数		字数	  字节数		文件名
>       12     	 112     1025        demo.csv

wc -l demo.csv
>      12 demo.csv

wc -w demo.csv
>     112 demo.csv

wc -c demo.csv
>    1025 demo.csv
```


