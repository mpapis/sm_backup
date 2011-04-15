### backup_sh
Library tool to support easy backup using bash tools

### author
Michal Papis <mpapis@gmail.com>

### installation
download library:

  mkdir ~/lib && cd ~/lib
  git clone git://github.com/mpapis/backup_sh.git

add to your ~/.bash_rc file:

  export PATH=$PATH:~/lib/backup_sh

### usage
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
