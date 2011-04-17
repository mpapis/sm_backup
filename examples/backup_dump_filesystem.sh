#!/bin/bash

source ~/lib/backup_sh/backup.sh
backup_dir ~/tmp/test

NAME=test
SUFFIX=fs
dump_dir -C ~/tmp/ test1
rotate 4