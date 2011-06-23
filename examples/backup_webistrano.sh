#!/usr/bin/env bash

#Load backup framework
. "/usr/local/bdsm/extensions/backup/modules/shell/initialize"

backup_dir ~/tmp/test

MYSQL_PARAMS='-u backup -pbackup_password'
#PREFIX=backup
NAME=webistrano
SUFFIX=db
dump_mysql
rotate 3
