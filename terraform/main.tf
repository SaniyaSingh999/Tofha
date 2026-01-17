provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "tofha_server" {
  ami           = "ami-0a0f1259dd1c90938"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.tofha_sg.name]

  tags = {
    Name = "Tofha-DevSecOps"
  }
}

resource "aws_security_group" "tofha_sg" {
  name = "tofha_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # ❌ Intentional vulnerability
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
