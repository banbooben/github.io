---
title: 批量修改mysql数据库字符集
comments: true
mathjax: true
date: 2020-05-27 00:19:02
tags: 修改字符集
categories: mysql
top:
false cover:
false password:
summary:
---


### 查询mysql数据库、表、字段数据集方法
- 查看数据库信息

    ```
    \s
    
    ```
- 查看数据库服务器和数据库（databases）的字符集
  
    ```
    mysql> show variables like '%char%';  
    +--------------------------+-------------------------------------+------  
    | Variable_name            | Value                               |......  
    +--------------------------+-------------------------------------+------  
    | character_set_client     | utf8                                |......   -- 客户端字符集  
    | character_set_connection | utf8                                |......  
    | character_set_database   | utf8                                |......   -- 数据库字符集  
    | character_set_filesystem | binary                              |......  
    | character_set_results    | utf8                                |......  
    | character_set_server     | utf8                                |......   -- 服务器字符集  
    | character_set_system     | utf8                                |......  
    | character_sets_dir       | D:\MySQL Server 5.0\share\charsets\ |......  
    +--------------------------+-------------------------------------+------ 
    ```

- 查看mysql数据表（tables）的字符集

    ```
    mysql> show table status from sqlstudy_db like '%countries%';  
    +-----------+--------+---------+------------+------+-----------------+------  
    | Name      | Engine | Version | Row_format | Rows | Collation       |......  
    +-----------+--------+---------+------------+------+-----------------+------  
    | countries | InnoDB |      10 | Compact    |   11 | utf8_general_ci |......  
    +-----------+--------+---------+------------+------+-----------------+------ 
    ```

- 查看mysql表字段的字符集

    ```
    mysql> show full columns from countries;  
    +----------------------+-------------+-----------------+--------  
    | Field                | Type        | Collation       | .......  
    +----------------------+-------------+-----------------+--------  
    | countries_id         | int(11)     | NULL            | .......  
    | countries_name       | varchar(64) | utf8_general_ci | .......  
    | countries_iso_code_2 | char(2)     | utf8_general_ci | .......  
    | countries_iso_code_3 | char(3)     | utf8_general_ci | .......  
    | address_format_id    | int(11)     | NULL            | .......  
    +----------------------+-------------+-----------------+-------- 
    ```

### 修改数据库字符集


- 修改单个表中所有字段的字符集

    ```
    alter table table_name convert to character set utf8mb4 collate utf8mb4_bin;
    ```


- 修改某个数据库下的所有表的字符集

    ```
    #查询出所有的表的名字并做字段拼接，再执行查询出来的语句即可
    
    select CONCAT("alter table",a.table_name,"convert to character set utf8mb4 collate utf8mb4_bin;") from (select table_name from information_schema.`TABLES` where TABLE_SCHEMA = "databases_name") a;
    
    alter tablebox_labeling_itemconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tablecheck_ruleconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tableclassifyconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tableclassify_category_groupconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tableclassify_category_group_resultconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tableclassify_taskconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tabledocsconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tabledocs_diffconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tabledocs_diff_rule_punctuationconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tabledocs_statusconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tabledocs_tempconvert to character set utf8mb4 collate utf8mb4_bin;
    alter tableentity_resultconvert to character set utf8mb4 collate utf8mb4_bin;
    
    ```
    > 此处可以配合pymysql第三方库，用python脚本实现批量修改



