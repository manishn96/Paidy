variable "network_interface_id" {
  type = string
  default = "eni-0e54bf0ce335909fd"
}

variable "ami" {
    type = string
    default = "ami-07200fa04af91f087"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}