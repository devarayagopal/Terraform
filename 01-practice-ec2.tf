resource "aws_instance" "terraform-practice" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow-allow.id]

    tags = {
        Name = "Terraform-v1"
        Terraform-v1 = "true"
    }
  
}

resource "aws_security_group" "allow-allow" {
    name = "allow-allow"


    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-allow"
  }
  
}