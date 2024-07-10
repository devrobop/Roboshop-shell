NODEJS() {
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  cp $(component).service  /etc/systemd/system/$(component).service
  cp mongo.repo /etc/yum.repos.d/mongo.repo


   useradd roboshop
   mkdir /app 
   curl -o /tmp/$(component).zip https://roboshop-artifacts.s3.amazonaws.com/$(component)-v3.zip 
   cd /app 
   unzip /tmp/$(component).zip

   cd /app 
   npm install 

   systemctl daemon-$(component)
   systemctl enable $(component) 
   systemctl start $(component)
}


# cp user.service  /etc/systemd/system/user.service
# cp cart.service /etc/systemd/system/cart.service
