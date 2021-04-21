resource "aws_default_route_table" "test-terraform-rt" {
  default_route_table_id = aws_vpc.test-terraform-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-terraform-ig.id
  }

  tags = {
    Name = "test-terraform-rt"
  }
}