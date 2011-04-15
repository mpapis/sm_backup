#!/bin/bash

source ~/lib/backup_sh/backup.sh
backup_dir ~/tmp/test

MYSQL_PARAMS='-u backup -pbackup_password'
#PREFIX=backup
NAME=webistrano
SUFFIX=db
dump_mysql
rotate 3
