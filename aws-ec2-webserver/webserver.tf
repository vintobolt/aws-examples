provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "lolcatbolt"
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "my_webserver" {
  instance_type = "t2.micro"
  ami           = "ami-090fa75af13c156b4"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
echo "<h2>WebServer</h2><br>Build by Terraform!"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF
  tags = {
    Name = "Web server build by Terraform"
    Owner = "vinto"
  }
}

resource "aws_security_group" "my_webserver" {
  name = "Webserver security group"
  description = "my first security group"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web Server securityGroup"
    Owner = "vinto"
  }

}