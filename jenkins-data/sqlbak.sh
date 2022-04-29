#!/bin/bash

DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
S3_BAK_NAME=$5
DB_BAK_NAME=HOLY_DB_$DATE.sql

echo "Retriving Dump Backup From SQL Server ..." ;
mysqldump -u root -h $DB_HOST --password=$DB_PASSWORD $DB_NAME > /tmp/$DB_BAK_NAME ;
echo "Backup Done..." ;
export AWS_ACCESS_KEY_ID=AKIARTOXN3U2LT66VVU5 && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading $DB_BAK_NAME ! ..." && \
aws s3 cp /tmp/$DB_BAK_NAME s3://$S3_BAK_NAME/$DB_BAK_NAME ;

echo "Jobs Done !"
