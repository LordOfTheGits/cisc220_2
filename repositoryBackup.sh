#!/bin/bash

#cron job

repository=$1 

github=$2

username=$3

password=$4

date=$(date +%y%m%d%h)

tar -czf backup$date.tgz/  --exclude= backup*.tgz

git add backup$date.tgz

git commit backup$date.tgz

git push https://$username:$password@$github --all  
