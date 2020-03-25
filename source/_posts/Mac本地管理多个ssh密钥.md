---
title: Mac本地管理多个ssh密钥
date: 2020-03-25 21:35:35
tags: ssh密钥管理
comments: true
mathjax: true
top: 
false cover:
false password:
summary:
categories:
---

​		学习、工作使用一台电脑，难免会有诸多不便：gitlab账号、dockerhub账号、跳板机等等，都会用到公钥，而且一般都是用公司邮箱生成的，但自己又要学习，记录一些代码，写一些小项目，总不能也用公司的吧，所以通过各种搜索有了这篇记录。

### 如何使用

- 本地生成密钥（自己的、公司的使用不同的名字区分）
- 公钥id_ras.pub添加到不同库
    - 将自己的密钥添加到github账号下的SSH and GPG keys中
    - 将公司的密钥添加到公司gitlab账号下的ssh keys中
- 配置`~/.ssh/config`文件
- 取消设置的全局用户名和邮箱
- 将所有私钥添加到ssh代理中
- 在不同的项目中设置不同的名字和邮箱

#### 生成密钥

```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# 或
ssh-keygen -t rsa  -C "your_email@example.com"

# 例如：
ssh-keygen -t rsa -b 4096 -C "shangyameng@datagrand.com"
> Generating public/private rsa key pair.
> Enter file in which to save the key (/Users/sarmn/.ssh/id_rsa): id_rsa_datagrand

```

- 注意：此处确认后，会提示输入一个名字（用于区分不同的ssh），后面的可以一路回车



#### 修改`~/.shh/config`配置文件

```shell
# 只有一个时的全局写法
# Host *
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_rsa

# 根据创建的密钥，添加在此文件中
# 若有其他服务需要使用密钥，则可根据以下样式添加

# github
Host github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
    UserKnownHostsFile=~/.ssh/known_hosts
    User laotozi

# gitlab
Host git.datagrand.com
    HostName git.datagrand.com  //这里填你们公司的git网址即可
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_datagrand
    UserKnownHostsFile=~/.ssh/known_hosts
    User shangyameng

```

### 

#### 启动后台ssh代理

```shell
eval "$(ssh-agent -s)"
> Agent pid 59566
```



#### 将私钥添加到ssh-agent并将密码存储在密钥链中(若设置的有密码)

```shell
# 添加到管理
ssh-add -K ~/.ssh/id_rsa_datagrand

# 查看已添加到ssh密钥
ssh-add -l
```



#### 若设置的有全局的用户名和邮箱需要执行以下操作

```shell
# 清除全局使用的 用户名、邮箱 配置
git config --global --unset user.name
git config --global --unset user.email

# 在git clone 后需要在改项目目录下设置单独的用户名和账号
# 设置单独项目的用户名和帐号
cd $project_path/
git config user.email 'shangyameng@datagrand.com'
git config user.name 'shangyameng'
```



#### 相应仓库中加入创建的ssh公钥

```shell
# 可以使用pbcopy < 命令来进行拷贝公钥到粘贴板
pbcopy < ~/.ssh/id_rsa.pub

# 到仓库的个人主页settings中的SSH and GPG keys中添加粘贴到的公钥
```


