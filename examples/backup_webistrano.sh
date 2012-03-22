#!/usr/bin/env sm

__sm.module.include "backup/scripting" || __sm.log.fail \
  "backup extension not available, install it with:  sm ext install backup mpapis/sm_backup"

backup_dir ~/tmp/test

MYSQL_PARAMS='-u backup -pbackup_password'
#PREFIX=backup
NAME=webistrano
SUFFIX=db
dump_mysql
rotate 3
