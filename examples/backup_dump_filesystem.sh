#!/bin/bash

#Load backup framework
. "/usr/local/bdsm/extensions/backup/modules/shell/initialize"

backup_dir ~/tmp/test

NAME=test
SUFFIX=fs
dump_dir -C ~/tmp/ test1
rotate 4