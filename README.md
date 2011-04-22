## backup_sh
Library tool to support easy backup using bash tools

## author
Michal Papis <mpapis@gmail.com>

## installation
download library:

    mkdir ~/lib && cd ~/lib
    git clone git://github.com/mpapis/backup_sh.git

add to your ~/.bashrc file:

    export PATH=$PATH:~/lib/backup_sh

now restart console or run above command in eah shell which will be used for backup

## usage
create simple bash script ~/lib/backup_sh/backup_something.sh:

    #!/bin/bash
    
    source ~/lib/backup_sh/backup.sh
    backup_dir ~/backups
    
    NAME=your_db_name
    SUFFIX=db
    dump_mysql
    rotate 3

add execution rights to the new script:

    chmod +x ~/lib/backup_sh/backup_something.sh

make a test run of backup:

    ~/lib/backup_sh/backup_something.sh

add a cron job to run the script:

    crontab -e

you probably got an vim editor so press `i` for editing mode and paste this line

    6 0 * * * ~/lib/backup_sh/backup_something.sh

and save the changes by pressing `ESC :wq` (vim editor), this will call the backup everyday at 6am.

## available functions

### building file name for backup files

File name consists of a pattern, date token and extansion. Pattern is build from prefix, name, and suffix. By default prefix is set to `backup`, but can be overriden by setting `PREFIX` variable. Name is taken from `NAME` variable, in most cases first or second command argument overides it. Suffix when not set will be not used, to set it use `SUFFIX` variable. Pattern is build as folows `PREFIX_NAME(SUFFIX_)`. General operations are using following pattern `pattern*`.

### backup_dir

Crreate and enter specified directory, it is intended to be root of local operartion

    backup_dir ~/backup

### rotate

Cleans files in local directory

    rotate 3

Above command will keep only last 3 backups (in context of name)

### dump_mysql

Creates compresed datbase backup name can be given as first parameter, if ommited then `NAME` variable is read

    dump_mysql blog

Database parmaeters can be given as second parameter or by `MYSQL_PARAMS` variable (which is easier for multiple databases).

    dump_mysql blog '-u db_user -ppassword -h localhost'

### dump_dir

Creates package with files, if `NAME` is not set then basename of first directory is used.

    dump_dir /some/path/application_data

