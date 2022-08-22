terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_security_group" "selected" {
  id ="sg-0fa2f21bff4ed2727"
}

resource "aws_instance" "paidy" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "paidykey"
  user_data = file("install-docker.sh")
  tags = {
    Name = "paidytftest"
  }
  
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  
  credit_specification {
    cpu_credits = "unlimited"
  }
  
}