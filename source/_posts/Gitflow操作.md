---
title: Gitflow操作
comments: true
mathjax: true
date: 2020-04-14 12:40:34
tags: Gitflow
categories: Git
top:
false cover:
false password:
summary:
---
### 特点

#### 简介

- Gitflow流程仍然使用一个中央代码仓库，它是所有开发者的信息交流中心。跟其他的工作流程一样，开发者在本地完成开发，然后再将分支代码推送到中央仓库。唯一不同的是项目中分支的结构。
- Gitflow主要使用两个分支来记录项目的开发进程（master和develop分支）。
- **Gitflow流程就是围绕这两个分支**

#### Git Flow 常用分支

- Git Flow 在管理过程中一般拥有5类常用分支：
  - **master分支(保护分支)**
    - 又名production分支，用于保存官方的发布历史(正式)	：
    - 只有这个分支的代码才会发布到生产环境
    - 此分支只能从其他分支合并，不能直接修改
    - 所有来到master分支的commit都应该被打tag
    - 也可使用版本号为master上的所有提交打标签（tag）也很方便。
  - **develop分支(保护分支)：**
    - **这是我们的主开发分支**，工程师所有的功能性开发都会基于develop分支。
    - develop分支包含所有要发布到下一个release的代码。
    - 这个分支有以下特性：
      - 不主动向其他分支合入代码；
      - 作为feature分支的源分支，最终接受feature分支的代码合入；
      - 作为release分支的源分支，接受最终release分支的合入；
  - **feature分支：**
    - **这是工程师用来开发一个新功能的分支**，一旦开发完成，Maintainer将其合入develop分支
    - 从而将这些功能准备进入下一个release。
    - **注意：**一旦feature分支合入develop分支，Maintainer应立即删除该feature分支； 
  - **release分支：**
    - **用于产品发布使用的分支**
    - develop分支积聚了足够多的新功能（或者预定的发布日期临近了），我们需要发布一个release分支时，Maintainer需要基于develop分支，创建相应的release分支。
    - 完成release分支之后，Maintainer需要将release分支同时合入master分支以及合回develop分支（合入master分支之后，立即完成master分支的tag操作，最终maintainer删除release分支）
  - **hotfix分支：**
    - **出现bug时用于修改该bug创建的分支**
    - 只有当master分支上出现bug时，我们会采用hotfix分支。
    - hotfix分支源于master分支，完成bug修复之后，同时合入master分支以及develop分支
    - 注意: hotfix合入master分支之后，额外立即完成master分支的tag操作，并删除hotfix分支。

### 开发使用实例

- master和develop分支模型

![img](http://blog.didispace.com/content/images/posts/gitflow-info-5.png)

- 使用详解

  - 创建空的develop分支，推送到服务器，用于功能开发，develop分支将包含项目的所有历史，而master会是一个缩减版本。

    ![img](http://blog.didispace.com/content/images/posts/gitflow-info-6.png)

    ```
    git branch develop
    git push -u origin develop
    ```

  - 其他开发者克隆（clone）中央仓库，并且为develop创建一个追踪分支。

    ```
    git clone ssh://user@host/path/to/repo.git
    git checkout -b develop origin/develop
    ```

  - 开发者开发的时候创建基于develop的开发分支，开发自己的功能，即**feature分支**

    ![img](http://blog.didispace.com/content/images/posts/gitflow-info-7.png)

    ```
    git checkout -b some-feature develop
    
    git status
    git add <some-file>
    git commit -m 'text'
    ```

  - 功能开发完毕，就可以将代码合并到develop分支

    ![img](http://blog.didispace.com/content/images/posts/gitflow-info-8.png)

    ```
    # 每次提交前要先pull代码
    git pull origin develop
    git checkout develop
    git merge some-feature
    git push
    git branch -d some-feature
    ```

  - 功能开发完毕，发布产品时，需要发布一个release分支来做产品发布的准备工作,即**release分支**

    ![img](http://blog.didispace.com/content/images/posts/gitflow-info-9.png)

    ```
    git checkout -b release-0.1 develop
    ```

    > 1、专门用于发布前的准备，包括一些清理工作、全面的[测试](http://lib.csdn.net/base/softwaretest)、文档的更新以及任何其他的准备工作。
    >
    > 2、发布的版本号也最初确定下来

  - 发布工作准备好之后就可以进行分支合并发布了,发布分支合并入master和develop分支

    ![img](http://blog.didispace.com/content/images/posts/gitflow-info-10.png)

    ```
    git checkout master
    git merge release-0.1
    git push
    
    git checkout develop
    git merge release-0.1
    git push
    
    git branch -d release-0.1
    ```

    > 此处将代码合并到master分支，应该打上合适的标签(tag)
    >
    > ```
    > git tag -a 0.1 -m"Initial public release" master
    > git push --tags
    > ```

  - 产品发布后发现bug需要修改时，此时创建基于master的维护分支，即**hotfix分支**

    ![img](http://blog.didispace.com/content/images/posts/gitflow-info-11.png)
    
    ```
    git checkout -b issue-#001 master
    \# Fix the bug
    
    git checkout master
    git merge issue-#001
    git push
    git tag -a 0.1 -m "Fix some bug" master
    git push --tags
    
    git checkout develop
    git merge issue-#001
    git push
    git branch -d issue-#001
    ```
    
    > 维护分支和发布分支一样，代码要合并到master和develop两分支
  
- git merge –no-ff 可以保留merge之前的历史分支


[参考: Gitflow工作流程]([https://blog.csdn.net/happydeer/article/details/17618935?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522158813816319724839232386%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=158813816319724839232386&biz_id=0&utm_source=](https://blog.csdn.net/happydeer/article/details/17618935?ops_request_misc=%7B%22request%5Fid%22%3A%22158813816319724839232386%22%2C%22scm%22%3A%2220140713.130102334.pc%5Fblog.%22%7D&request_id=158813816319724839232386&biz_id=0&utm_source=))
