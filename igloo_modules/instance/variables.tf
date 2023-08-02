variable "ami" {
  type          = string
  default       = "ami-0ddf7dfd13a83d8c8"
}

variable "instance_type" {
  type          = string
  default       = "t2-nano"
}

variable "instance_name" {
  description   = "Value of the Name tag for the EC2 instance"
  type          = string
  default       = "IglooInstance"
}

variable "key_name" {
  type          = string
  default       = "igloo_dev"
}