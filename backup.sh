#!/bin/bash

# usage:
#   backup_dir directory
# ensures that the given directory exists and sets it as target for backups
function backup_dir(){
  echo "Backup directory $1"
  [ -d $1 ] || mkdir $1
  cd $1
}

# usage:
#   dump_mysql [db_name] ['db_params']
# name if not given will use $NAME
# db_params if not given will use $MYSQL_PARAMS
function dump_mysql(){
  db_name=${1:-$NAME}
  mysql_params=${2:-$MYSQL_PARAMS}
  file=$(backup_pattern "$db_name" "$(time_marker).sql.gz")
  echo "Creating file $file" >&2
  mysqldump $mysql_params $db_name | gzip -c > $file
}

# usage:
#   dump_dir directory [another/directory]
# create package with the given directories, 
# options can also contain -C relative/point/of/backup ex:
#   dump_dir -C /my/files/path dir_to_backup file_to_backup
# if $NAME is not set package is named after the first directory
function dump_dir(){
  name=${NAME:-$(basename $1)}
  file=$(backup_pattern "$name" "$(time_marker).tgz")
  echo "Creating file $file" >&2
  tar czf $file "$@"
}

# usage:
#   rotate [amount] ['pattern']
# default is to keep last 5 files starting with backup_$NAME_*
function rotate(){
  amount=${1:-5}
  echo "Cleaning: leaving last $amount backups"
  ls -1v $(backup_pattern "$2" '*') 2>/dev/null | head -n -$amount | while read file
  do
    echo -n "  removing $file ... " && rm -rfv $file || echo 'failed'
  done
}

# usage:
#   ssh_push remote_location
# rsync backup dir to ssh location, clean extraneous files on remote
function ssh_push(){
  sh -c "$(echo $1 | sed -r 's/(.*):(.*)/ssh \1 "mkdir -p \2"/')"
  rsync --rsh=ssh --del  -av . $1
}

# usage:
#   backup_pattern name [additional]
# generates name suitable for common actions
function backup_pattern(){
  prefix=${PREFIX:-backup}
  name=${1:-$NAME}
  suffix=${SUFFIX:+${SUFFIX}_}
  echo ${prefix}_${name}_${suffix}$2
}

# usage:
#   time_marker
# generates universal time maker
function time_marker(){
  date +%Y%m%d_%H%M%S
}
