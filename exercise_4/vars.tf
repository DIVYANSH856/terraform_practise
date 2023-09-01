variable "region" {
  default = "us-east-1"
}
variable "zone1" {
  default = "us-east-1a"
}
variable "aims" {
  type = map(any)
  default = {
    us-east-1 = "ami-051f7e7f6c2f40dc1"
    us-east-2 = "ami-024e6efaf93d85776"
  }
}
variable "user" {
  default = "ec2-user"
}