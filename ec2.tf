resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all-allow.id]

  tags = {
    Name = "Terraform"
    Terraform = "true"
  }
  
}

resource "aws_security_group" "allow-all-allow" {
    name = "allow-all-allow"

    egress {
    from_port        = 0  # from port 0 to port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  

  tags = {
    Name = "allow-all-allow"
  }
}