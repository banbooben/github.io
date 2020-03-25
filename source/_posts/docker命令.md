---
title: docker命令
date: 2020-03-22 17:09:10
tags: docker
comments: true
top:
false cover:
false password:
summary:
categories:
---

- 列出所有的容器ID

  ```
  docker ps -aq
  ```

- 停止所有正在运行的程序

  ```
  docker stop $(docker ps -aq)
  ```

- 删除所有容器

  ```
  docker rm $(docker ps -aq)
  ```

- 删除所有已停止的容器

  ```
  docker container prune
  ```

- 删除所有镜像

  ```
  docker rmi $(docker images -q)
  ```

- 容器已经起来的时候进入容器内部

  ```
  docker exec -it name /bin/bash
  ```

  

### 导入倒出容器

- 备份某容器的快照并保存到本地：

  ```
  Docker export flask:1.0 > my_flask.tar
  ```

- 将本地备份的快照导入到容器中

  ```
  cat docker/ubuntu.tar | docker import - test/ubuntu:v1
  ```
















