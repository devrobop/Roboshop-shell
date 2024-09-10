LOG_FILE=/tmp/roboshop.log 

rm -f $LOG_FILE

PRINT() {
  echo 
  echo 
  echo  "######################### $* ##########################"
}

NODEJS() {
   PRINT Disable NodeJS Default Version
   dnf module disable nodejs -y &>>$LOG_FILE

   PRINT Enable NodeJS 20 Module
   dnf module enable nodejs:20 -y &>>$LOG_FILE

   PRINT Install NodeJS
   dnf install nodejs -y &>>$LOG_FILE

   PRINT Copy Service File 
   cp $(component).service  /etc/systemd/system/$(component).service &&>>$LOG_FILE
  
   PRINT Copy MongoDB repo File 
   cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$LOG_FILE

   PRINT Adding Application User 
   useradd roboshop &>>$LOG_FILE

   PRINT Cleaning Old content
   rm -rf /app &>>$LOG_FILE

   PRINT Create App directory 
   mkdir /app  &>>$LOG_FILE
  
   echo Download App Content
   curl -o /tmp/$(component).zip https://roboshop-artifacts.s3.amazonaws.com/$(component)-v3.zip &>>$LOG_FILE
   
   PRINT enter the app file  
   cd /app &>>$LOG_FILE
  
   PRINT Extract App Content
   unzip /tmp/$(component).zip &>>$LOG_FILE

   PRINT Download NodeJS Dependencies
   npm install &>>$LOG_FILE


   PRINT Start Service
   systemctl daemon-$(component) &>>$LOG_FILE
   systemctl enable $(component) &>>$LOG_FILE
   systemctl start $(component) &>>$LOG_FILE
}


# cp user.service  /etc/systemd/system/user.service
# cp cart.service /etc/systemd/system/cart.service
