#!/usr/bin/env sm

__sm.module.include "backup/scripting" || __sm.log.fail \
  "backup extension not available, install it with:  sm ext install backup mpapis/sm_backup"

backup_dir ~/tmp/test

NAME=test
SUFFIX=fs
dump_dir -C ~/tmp/ test1
rotate 4
