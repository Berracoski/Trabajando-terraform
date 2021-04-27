resource "aws_security_group" "acceso-ssh-sg" {
  name        = "test-terraform-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.test-terraform-vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
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
    Name = "acceso-ssh-sg"
  }
}
##Acceso http
resource "aws_security_group" "acceso-http-sg" {
  name        = "acceso-http-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.test-terraform-vpc.id

  ingress {
    description = "Allow HTTP"
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

  tags = {
    Name = "acceso-http-sg"
  }
}