#!/usr/bin/env bdsm

#Load backup framework
module_or_error "backup/scripting" \
  "backup extension not available, install it with:  bdsm extend mpapis/bdsm_backup backup"

backup_dir ~/tmp/test1
ssh_push localhost ~/tmp/test2
