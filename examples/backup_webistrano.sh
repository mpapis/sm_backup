#!/usr/bin/env sm

#Load backup framework
module_or_error "backup/scripting" \
  "backup extension not available, install it with:  bdsm extend mpapis/bdsm_backup backup"

backup_dir ~/tmp/test

MYSQL_PARAMS='-u backup -pbackup_password'
#PREFIX=backup
NAME=webistrano
SUFFIX=db
dump_mysql
rotate 3
