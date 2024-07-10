source common.sh
cp nginx.conf /etc/nginx/nginx.conf

NODEJS

systemctl enable nginx 
systemctl start nginx 

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip
# update the config file in order  for smooth execution
systemctl restart nginx 