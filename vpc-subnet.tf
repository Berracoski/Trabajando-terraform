resource "aws_subnet" "Public-subnet" {
  vpc_id                  = aws_vpc.test-terraform-vpc.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet"
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