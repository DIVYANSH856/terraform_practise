resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}

resource "aws_instance" "dove-web" {
  ami                    = var.amis[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-05679cc6f58963c0b"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}
resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.zone1
  size              = 3
  tags = {
    Name = "extr-vol-4-dove"
  }
}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-web.id
}

output "PublicIP" {
  value = aws_instance.dove-web.public_ip
}


