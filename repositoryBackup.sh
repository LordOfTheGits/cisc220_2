#!/bin/bash
#cron job 0 1 * * * ./repositoryBackup.sh >> backupsLog

repository=$1
github=$2
username=$3
password=$4

date=$(date +%Y%M%D%H)

tar -czf backup$date.tgz/  --exclude= backup*.tgz
echo Backup backup$date.tgz created successfully!

git add backup$date.tgz

git commit backup$date.tgz
echo Backup backup$date.tgz committed to the local git repository

git push https://$username:$password@$github --all
echo Backup backup$date.tgz pushed to the remote git repository $repository
