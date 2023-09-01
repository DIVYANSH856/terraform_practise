resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}

resource "aws_security_group" "dove-security-group" {
  name        = "dove-sg"
  description = "Security group for Dove instance"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing HTTP from anywhere
  }
}
resource "aws_instance" "dove-key" {
  ami               = var.aims[var.region]
  instance_type     = "t2.micro"
  availability_zone = var.zone1
  key_name          = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-security-group.id]

  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    user        = var.user
    private_key = file("dovekey")
    host        = self.public_ip
  }
}