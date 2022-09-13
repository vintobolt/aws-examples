provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "lolcatbolt"
}

data "aws_availability_zones" "working" {}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}
