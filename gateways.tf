resource "aws_internet_gateway" "test-terraform-ig" {
  vpc_id = aws_vpc.test-terraform-vpc.id

  tags = {
    Name = "test-terraform-ig"
  }
}