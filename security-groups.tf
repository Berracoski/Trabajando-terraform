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
##Acceso http afuera
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
##Acceso http interno
resource "aws_security_group" "acceso-http-wordpress-sg" {
  name        = "acceso-http-wordpress-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.test-terraform-vpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.Public-subnet-1.id, aws_subnet.Public-subnet-2.id]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "acceso-http-wordpress-sg"
  }
}
##MySQL
resource "aws_security_group" "acceso-mySQL-sg" {
  name        = "acceso-mySQL-sg"
  description = "Allow MySQL inbound traffic"
  vpc_id      = aws_vpc.test-terraform-vpc.id

  ingress {
    description = "Allow mySQL"
    from_port   = 3306
    to_port     = 3306
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
    Name = "acceso-mySQL-sg"
  }
}