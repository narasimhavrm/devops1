#!/usr/bin/bash
# This is to test new branch for mongodb
touch /etc/yum.repos.d/mongo.repo
echo "[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/4.2/x86_64/
gpgcheck=0
enabled=1" > /etc/yum.repos.d/mongo.repo

dnf install mongodb-org -y
echo "Installation step is complete"
systemctl enable mongod
systemctl start mongod

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

systemctl restart mongod