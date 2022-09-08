provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "lolcatbolt"
}

resource "aws_default_vpc" "default" {}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
  vpc = true
  tags = {
    Name = "Web Server IP"
    Owner = "OZ"
  }
}

resource "aws_instance" "my_webserver" {
  instance_type = "t2.micro"
  ami           = "ami-090fa75af13c156b4"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("install-apache.sh.tpl", {
    f_name = "Oleksandr", 
    l_name = "Zatserklianyi",
    names = ["Vasia", "Olia", "Petya", "Donald", "Jack", "Masha", "Jackson", "Alexa", "Ivan"]
  })
  tags = {
    Name = "Web server build by Terraform"
    Owner = "vinto"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "my_webserver" {
  name = "Webserver security group"
  description = "my first security group"
  vpc_id = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
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
