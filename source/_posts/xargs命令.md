---
title: xargs命令
comments: true
mathjax: true
date: 2020-04-01 12:16:06
tags: xargs
categories: Linux
top:
false cover:
false password:
summary:
---

- xargs是一个给命令传递参数的过滤器，也是组合多个命令的工具
    - 可以将单行或多行转换成其他格式
    - 可以将管道或标准输入数据转换成其他命令行参数，也能从文件中读取数据
    - 可以捕获一个命令的输出，作为另一个命令的输入

#### 命令

```shell
somecommand |xargs -item  command
```

- 不同的item参数，执行不同的功能

#### 参数

```shell
# -item参数解读
	# -a file 从文件中读取数据，作为输入数据
	# -e flag xargs分析道含有flag这个标志的时候就会停止
	# -p 每执行一个argument就询问一次用户
	# -n num 命令command在执行一次的时候用的argument个数，默认所有
	# -t 表示先打印命令，再执行。
	# -i 或 -I 将xargs的每项名称（一行一行）赋值给{}，可以用{}代替
	# -r no-run-if-empty 当xargs的输入为空的时候则停止xargs，不用再去执⾏了。
	# -s num 命令⾏的最⼤字符数，指的是xargs后面那个命令的最⼤命令⾏字符数。
	# -L num 从标准输⼊一次读取num行送给command命令。
	# -l 同 -L。
	# -d delim 分隔符，默认的xargs分隔符是回⻋，argument的分隔符是空格，这⾥修改的是xargs的分隔符。
	# -x exit的意思，主要是配合-s使⽤用。。
	# -P 修改最⼤大的进程数，默认是1，为0时候为as many as it can。


```



#### 示例

```shell
# 示例 demo.txt
cat demo.txt
> a b c d
> e f g h

# 多行变单行
cat demo.txt | xagrs
> a b c d e f g h

#-d定义定界符
echo "axbxcxdx" | xargs -dx
> a b c d

# -d -n 组合使用
echo "axbxcxdx" | xargs -dx -n2
> a b
> c d

# 待删除文件夹中文件很多时（报：”/bin/rm: Argument list too long”错误）
# 使用xargs配合rm使用，来删除
ls | xargs -n 10 rm -rf
```


