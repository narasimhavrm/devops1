#Install GoLang
dnf install golang -y

#Add Application user
useradd roboshop

#Create app directory
mkdir /app

#Download the application code to created app directory.
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip

#Lets download the dependencies & build the software.
cd /app
go mod init dispatch
go get
go build

#Setup SystemD Payment Service
cp dispatch.service /etc/systemd/system/dispatch.service

#Load the service.
systemctl daemon-reload

#Start the service
systemctl enable dispatch
systemctl start dispatch