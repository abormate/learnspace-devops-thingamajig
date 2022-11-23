# configure package management system for yum install
# create a "/etc/yum.repos.d/mongodb-org-4.2.repo" (example) file so that you can install MongoDB directly with yum install

yum install mongodb-org -y

# documentation for Mongo DB -- https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/

# start mongo-db service
systemctl start mongod

#check status to make sure it's running 
systemctl status mongod

# logs for monitoring system
cat /var/log/mongodb/mongod.log

# default listening port and IP addr for Mongo DB community edition (freeware)
# default port = 27017
# default listening on = 127.0.0.1 (loopback localhost -- defaults on listening to just the self-host system for the community edition, not for prod)

# config file for mongo db
/etc/mongod.conf


