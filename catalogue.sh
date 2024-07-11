source common.sh
component=catalogue
NODEJS


echo installing mongo db client
dnf install mongodb-mongosh -y &>$LOG_FILE
mongosh --host mongo.dev.devrobo.online </app/db/master-data.js