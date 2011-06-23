#!/bin/bash

#Load backup framework
. "/usr/local/bdsm/extensions/backup/modules/shell/initialize"

backup_dir ~/tmp/test1
ssh_push localhost ~/tmp/test2
