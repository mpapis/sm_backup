#!/usr/bin/env sm

__sm.module.include "backup/scripting" || __sm.log.fail \
  "backup extension not available, install it with:  sm ext install backup mpapis/sm_backup"

backup_dir ~/tmp/test1
ssh_push localhost ~/tmp/test2
