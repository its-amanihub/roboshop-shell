 source common.sh
 app_name=dispatch

echo -e "$color copy dispatch service file $no_color"
cp dispatch.service /etc/systemd/system/dispatch.service &>>$log_file

echo -e "$color install golang $no_color"
dnf install golang -y &>>$log_file

echo $?

app_prerequisites

echo -e "$color download application dependencies $no_color" 
go mod init dispatch &>>$log_file
go get &>>$log_file
go build &>>$log_file

echo $?

echo -e "$color start application service $no_color"

systemctl daemon-reload &>>$log_file
systemctl enable dispatch &>>$log_file
systemctl restart dispatch &>>$log_file

echo $?