resource "aws_instance" "test-terraform-ec2" {
  ami                    = var.centos7
  instance_type          = var.instance_type
  key_name               = "ssh-aws"
  vpc_security_group_ids = [aws_security_group.test-terraform-sg.id]
  subnet_id              = aws_subnet.test-terraform-subnet.id
  tags = {
    Name      = "test-terraform-ec2"
    terraform = "True"

  }
}