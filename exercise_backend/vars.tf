variable "region" {
  default = "us-east-1"
}
variable "zone1" {
  default = "us-east-1a"
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