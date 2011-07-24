#!/usr/bin/env bdsm

#Load backup framework
module_or_error "backup" \
  "backup extension not available, install it with:  bdsm extend mpapis/bdsm_backup backup"

backup_dir ~/tmp/test

NAME=test
SUFFIX=fs
dump_dir -C ~/tmp/ test1
rotate 4