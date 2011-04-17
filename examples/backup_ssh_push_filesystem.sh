#!/bin/bash

source ~/lib/backup_sh/backup.sh

backup_dir ~/tmp/test1
ssh_push localhost:~/tmp/test2
