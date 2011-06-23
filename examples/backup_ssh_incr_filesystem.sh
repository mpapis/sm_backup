#!/bin/bash

#Load backup framework
. "/usr/local/bdsm/extensions/backup/modules/shell/initialize"

ssh_incr localhost ~/tmp/test3 2 ~/tmp/test1/
