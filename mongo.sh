cp mongo.repo /etc/yum.repo.d/mongo.repo
dnf install mongodb-org -y 
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongo.conf
systemctl enable mongod 
systemctl start mongod 
systemctl restart mongod