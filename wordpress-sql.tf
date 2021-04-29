resource "aws_db_instance" "wordpress-sql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "wordpress"
  username             = "wordpressuser"
  password             = "password"
  #vpc_id               = aws_vpc.test-terraform-vpc.id
  vpc_security_group_ids = [ aws_security_group.acceso-mySQL-sg.id ]
  skip_final_snapshot  = true
}