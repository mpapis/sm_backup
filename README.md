## backup_sh
Library tool to support easy backup using bdsm and bash tools

## author
Michal Papis <mpapis@gmail.com>

## Prerequisites

BDSM - https://bdsm.beginrescueend.com/

## installation
First time installation:

    bdsm ext install backup mpapis/bdsm_backup

Updating to latest version:

    bdsm ext update backup

Take note that the backup name above can be replaced with other name if required.
Example:

    bdsm ext install mp_backup mpapis/bdsm_backup

This will influence all the following commands and require to reference this extension as mp_backup

## usage
create simple backup script

    bdsm backup setup sample_script

edit sample script

    bdsm backup edit sample_script

There are already some contents in the file, uncomment them to have fun with backups.

make a test run of backup:

    ./sample_script

add a cron job to run the script:

    crontab -e

you probably got an vim editor so press `i` for editing mode and paste this line

    6 0 * * * ~/lib/backup_sh/backup_something.sh

save the changes by pressing `ESC :wq` (vim editor), this will call the backup everyday at 6am.

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
