#!/bin/bash

# 获取当前时间 2020-03-25
time=$(date "+%Y-%m-%d")

git checkout develop | awk '{print $0}'

git status | awk '{print $0}'

git add . | awk '{print $0}'

git commit -m "${time}" | awk '{print $0}'

git pull | awk '{print $0}'

git push | awk '{print $0}'

