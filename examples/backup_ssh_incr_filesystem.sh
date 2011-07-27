#!/usr/bin/env bdsm

#Load backup framework
module_or_error "backup/scripting" \
  "backup extension not available, install it with:  bdsm extend mpapis/bdsm_backup backup"

ssh_incr localhost ~/tmp/test3 2 ~/tmp/test1/
