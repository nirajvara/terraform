### AWS key pair creation
provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

resource "aws_key_pair" "example_key_pair" {
  key_name   = "example-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}
