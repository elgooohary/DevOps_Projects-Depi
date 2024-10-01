provider "aws" {
  region = "us-west-1"
  shared_config_files      = ["/home/mo/.aws/config"]
  shared_credentials_files = ["/home/mo/.aws/credentials"]
}