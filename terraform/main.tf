terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "eu-north-1"
}

# Generate private key

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


# Create AWS key pair using generated public key

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}


# Security Group

resource "aws_security_group" "web_sg" {
  name = "web_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# EC2 

resource "aws_instance" "web" {
  ami           = "ami-023b6eace47afd3b4"
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Ansible-Web"
  }
}
