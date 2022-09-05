# user_data 

1. Указание с использованием "<<EOF"
`user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
echo "<h2>WebServer</h2><br>Build by Terraform!"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF`

2. Сохранить файл и открыть через file("path")

# VPC - Virtual Private Cloud 
