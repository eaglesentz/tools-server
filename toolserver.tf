resource "aws_instance" "Tool-Box" {
  ami                         = var.ami-id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  subnet_id                   = aws_subnet.tool_subnet.id
  security_groups             = [aws_security_group.Public_Instance_SG.id]
  user_data                   = file("${path.module}/Data/install.sh")
  key_name                    = var.keypair
  associate_public_ip_address = true
  lifecycle {
   create_before_destroy = true
  }
  tags = {
    Name = "${var.service_name}-Tool-Box"
  }
}
