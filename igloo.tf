provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "app-ami" {
  most_recent = true
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["379101102735"]
}

resource "aws_security_group" "igloo_SG" {
  name        = "igloo_SG"
  description = "Igloo security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.10.0/24"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "igloo_SG"
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.app-ami.id
  instance_type = "t2.micro"

  key_name = "igloo_dev" # replace with your key name

  subnet_id = "subnet-e9818992" # replace with your subnet id

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.igloo_SG.id] # using created security group

  tags = {
    Name = "IglooEC2TF"
  }
}