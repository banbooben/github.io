---
title: docker命令
date: 2020-03-22 17:09:10
tags: docker
comments: true
top:
false cover:
false password:
summary:
categories: docker
---
#### Mac安装docker

- Brew install

    ```
    # 使用brew安装
    
    brew install cask docker
    
    ```

    

#### docker基本命令

- docker单容器基本命令

  ```
  # 列出所有的容器ID
  docker ps -aq
  # 停止所有正在运行的程序
  docker stop $(docker ps -aq)
  
  # 删除所有已停止的容器
  docker rm $(docker ps -aq)
  
  # 删除所有镜像
  docker rmi $(docker images -q)
  
  # 容器已经起来的时候进入容器内部
  docker exec -it name /bin/bash
  
  ```

  

- docker container 常用命令

    ```
    docker container [command]
    
    # 查看所有容器
    docker container ls
    
    # 查看某个容器的详细信息
    docker container inspect xxxx
    
    # 查看容器日志
    docker container logs xxx
    
    # 删除所有已停止的容器
    docker container prune
    ```

    

- Docker service 常用命令

  ```
  docker service [command]
  
  # 创建一个新的服务
  docker service create
  
  # 查看所有的服务
  docker service ls
  
  # 更新服务
  docker service pdate --force xxxxxx
  
  # 查看服务启动日志
  docker service logs xxxxxx
  
  # 更改服务启动的数量
  docker service scale xxx=n
  
  # 查看某个服务的详细信息
  docker service inspect [options] xxxx
  	--pretty		# 格式化服务的详细信息
  ```

  

- Docker stack 常用命令

    ```
    docker stack [command]
    
    # 使用docker-compose.yml文件部署服务
    docker stack deploy -c docker-compose XXXXXX
    
    # 查看运行的服务
    docker stack ls
    
    # 删除服务
    docker stack rm xxx
    ```

    

- Docker swarm 集群命令

    ```
    docker swarm [command]
    
# 初始化一个机swarm集群
    docker swarm init [options] <ip>:[port]
    
        --advertise-addr	# 播发地址(格式：<ip/interface>[:port]
    
        --autolock false	# 启用管理员自动锁定(需要解锁键启动停止的管理器)
    
        --cert-expiry 2160h0m0s			# 节点证书的有效期(ns/us/ms/s/m/h)
    
        --dispatcher-heartbeat 5s		# 调度心跳周期(ns/us/ms/s/m/h)
    
        --external-ca					# 一个或多个证书签名端点的规范
    
        --force-new-cluster	false		# 强制从当前状态创建一个新的群集(Swarm)
    
        --listen-addr	0.0.0.0:2377	# 监听地址(格式：<ip / interface> [：port])
    
        --max-snapshots	0				# 要保留的额外的筏子快照数量
    
        --snapshot-interval	10000		# 筏子快照之间的日志条目数
    
        --task-history-limit	5		# 任务历史保留限制
    
    # 查看集群节点信息
    docker node ls
    
    # 查看集群网络信息
    docker network ls
    
    # 查看集群信息
    docker info
    
    ```
    
    

#### 导入倒出容器

- 备份某容器的快照并保存到本地：

  ```
  Docker export flask:1.0 > my_flask.tar
  ```

- 将本地备份的快照导入到容器中

  ```
  cat docker/ubuntu.tar | docker import - test/ubuntu:v1
  ```



#### Mac卸载docker

- 停止所有容器

    ```
    # 停止所有容器
    docker stop $(docker ps -a)
    
    # 清理释放资源
    docker system prune --all --volumes
    
    # 删除docker
    rm -rf /Applications/Docker.app/
    ```

