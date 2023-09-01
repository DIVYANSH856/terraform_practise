variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-053b0d53c279acc90"
    us-east-1 = "ami-0453898e98046c639"
  }
}