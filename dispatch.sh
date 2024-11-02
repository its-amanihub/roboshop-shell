 source common.sh
 app_name=dispatch

echo -e "$color copy dispatch service file $no_color"
cp dispatch.service /etc/systemd/system/dispatch.service

echo -e "$color install golang $no_color"
dnf install golang -y
app_prerequisites

echo -e "$color download application dependencies $no_color" 
go mod init dispatch
go get 
go build


echo -e "$color start application service $no_color"

systemctl daemon-reload
systemctl enable dispatch 
systemctl restart dispatch