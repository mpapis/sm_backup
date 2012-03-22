#!/usr/bin/env sm

__sm.module.include "backup/scripting" || __sm.log.fail \
  "backup extension not available, install it with:  sm ext install backup mpapis/sm_backup"

ssh_incr localhost ~/tmp/test3 2 ~/tmp/test1/
