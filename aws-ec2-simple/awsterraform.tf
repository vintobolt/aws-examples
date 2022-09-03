provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "lolcatbolt"
}

resource "aws_instance" "t2micro-test" {
  instance_type = "t2.micro"
  ami           = "ami-090fa75af13c156b4"
  tags = {
    Name = "t2micro-test"
  }
}
