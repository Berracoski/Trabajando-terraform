##Subnet Publicas
resource "aws_subnet" "Public-subnet-1" {
  vpc_id                  = aws_vpc.test-terraform-vpc.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-1"
  }
}
resource "aws_subnet" "Public-subnet-2" {
  vpc_id                  = aws_vpc.test-terraform-vpc.id
  cidr_block              = "172.16.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-2"
  }
}
##Subnet Privada
resource "aws_subnet" "Private-subnet" {
  vpc_id                  = aws_vpc.test-terraform-vpc.id
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Private-subnet"
  }
}