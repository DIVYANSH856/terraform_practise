resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "ship"
  vpc_security_group_ids = ["sg-05679cc6f58963c0b"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}
