#!/bin/bash

# usage:
#   rotate [amount] ['pattern']
# default is to keep last 5 files starting with backup_$NAME_*
function rotate(){
  amount=${1:-5}
  echo "Cleaning: leaving last $amount backups"
  prefix=${PREFIX:-backup}
  name=${2:-$NAME}
  suffix=${SUFFIX:+${SUFFIX}_}
  ls -1v ${prefix}_${name}_${suffix}* 2>/dev/null | head -n -$amount | while read file
  do
    echo -n "  removing $file ... " && rm -rfv $file || echo 'failed'
  done
}

# usage:
#   dump_mysql [db_name] ['db_params']
# name if not given will use $NAME
# db_params if not given will use $MYSQL_PARAMS
function dump_mysql(){
  db_name=${1:-$NAME}
  mysql_params=${2:-$MYSQL_PARAMS}
  mysqldump $mysql_params $db_name | gzip -c > $(backup_file $db_name sql.gz)
}

# usage:
#   backup_file name extension
function backup_file(){
  prefix=${PREFIX:-backup}
  name=${1:-$NAME}
  suffix=${SUFFIX:+${SUFFIX}_}
  extension=${2:-backup}
  file="${prefix}_${name}_${suffix}$(date +%Y%m%d_%H%M%S).${extension}"
  echo "Creating file $file" >&2
  echo $file
}

function backup_dir(){
  echo "Backup directory $1"
  [ -d $1 ] || mkdir $1
  cd $1
}
