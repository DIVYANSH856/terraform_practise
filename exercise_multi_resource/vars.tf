variable "region" {
  default = "us-east-1"
}
variable "zone1" {
  default = "us-east-1a"
}
variable "zone2" {
  default = "us-east-1b"
}
variable "zone3" {
  default = "us-east-1c"
}
variable "amis" {
  type = map(any)
  default = {
    us-east-1 = "ami-026ebd4cfe2c043b2"
    us-east-2 = "ami-024e6efaf93d85776"
  }
}
variable "user" {
  default = "ec2-user"
}
variable "pub_key" {
  default = "dovekey.pub"
}

variable "priv_key" {
  default = "dovekey"
}