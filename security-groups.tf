resource "aws_security_group" "test-terraform-sg" {
  name        = "test-terraform-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.test-terraform-vpc.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.test-terraform-vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.test-terraform-vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "test-terraform-sg"
  }
}