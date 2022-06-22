resource "aws_security_group" "Public_Instance_SG" {
  vpc_id      = aws_vpc.proj-vpc.id
  description = "This is for the servers in the Public Subnet"
  ingress {
    #For SSH Connection
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.service_name}-SG"
  }

}