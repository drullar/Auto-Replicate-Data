# Auto-Replicate-Data


The Setup: A OpenMediaVault VM in ProxMox that has an external hard disk mounted and is being used as a shared folder. In the OpenMediaVault exist 2 FileSystems - one that's used for NFS file share (Linux, Unix, etc.) and one that's used for SMB File Share.

In TL;DR the idea is to copy files from one folder to the other, simulating a drag and drop kind of experience;

The idea of this project is to make a bash script that would check sertain files in the SMB Folder Share of OpenMediaVault and if they are not in the NFS Folder Share it will replicate it. There is going to be a list of folders that would be checked and the folders should exist in both Folders/File Systems. If the Folder is missing from the NFS one, it will be automatically created and populated with a copy of whatever files are in the SMB one.


# Cronjob setup

The cronjob makes it possible to run the script every hour or whatever time it needs to run at;

sudo systemctl start cron
crontab –e

Inside the cronjob file enter this and replace it with the location of your script.:

0 * * * * /etc/scripts/auto-copy-files.sh

## CRONJOB SRC:
https://linux.die.net/man/5/crontab
https://linuxhint.com/schedule_crontab_job_every_hour/
https://crontab.guru/every-1-hour
