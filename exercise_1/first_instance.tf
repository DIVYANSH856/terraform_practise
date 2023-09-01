provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0453898e98046c639"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "ship"
  vpc_security_group_ids = ["sg-05679cc6f58963c0b"]
  tags = {
    Name    = "instance1-ship"
    Project = "ship"
    new     = "new"
  }
}
