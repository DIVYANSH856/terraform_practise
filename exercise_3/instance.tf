resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}

resource "aws_instance" "dove-key" {
  ami                    = var.aims[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-05679cc6f58963c0b"]


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
