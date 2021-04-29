##WordPress
resource "aws_instance" "Wordpress-ec2" {
  ami                    = var.centos7
  instance_type          = var.instance_type
  key_name               = "id_rsa"
  vpc_security_group_ids = [aws_security_group.acceso-ssh-sg.id,aws_security_group.acceso-http-wordpress-sg.id]
  subnet_id              = aws_subnet.Private-subnet.id
  private_ip = "172.16.2.10"
  depends_on = [aws_db_instance.wordpress-sql]
  provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("/home/pablo/.ssh/id_rsa")
    host     = self.public_ip
    }
    inline = [
      "sudo -i",
      #"yum -y update",
      "yum install -y epel-release",
      "yum install -y httpd php php-mysql",
      #"firewall-cmd --zone=public --permanent --add-service=http",
      #"firewall-cmd --zone=public --permanent --add-service=https",
      #"firewall-cmd --reload",
    ]
  }
  tags = {
    Name      = "Wordpress-ec2"
    terraform = "True"
  }
}
##Proxy 1
resource "aws_instance" "Proxy-1-ec2" {
  ami                    = var.centos7
  instance_type          = var.instance_type
  key_name               = "id_rsa"
  vpc_security_group_ids = [aws_security_group.acceso-ssh-sg.id,aws_security_group.acceso-http-sg.id]
  subnet_id              = aws_subnet.Public-subnet-1.id
  provisioner "file" {
  source      = "./proxy-conf.conf"
  destination = "/etc/nginx/conf.d/proxy-conf.conf"

  connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("/home/pablo/.ssh/id_rsa")
    host     = self.public_ip
  }
}
  provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("/home/pablo/.ssh/id_rsa")
    host     = self.public_ip
    }
    inline = [
      "sudo -i",
      #"yum -y update",
      "yum install -y epel-release",
      "yum install -y nginx",
      "systemctl enable nginx",
      #"firewall-cmd --zone=public --permanent --add-service=http",
      #"firewall-cmd --zone=public --permanent --add-service=https",
      #"firewall-cmd --reload",
      "systemctl start nginx",
    ]
    }
  tags = {
    Name      = "Proxy-1-ec2"
    terraform = "True"

  }
}
##Proxy 2
resource "aws_instance" "Proxy-2-ec2" {
  ami                    = var.centos7
  instance_type          = var.instance_type
  key_name               = "id_rsa"
  vpc_security_group_ids = [aws_security_group.acceso-ssh-sg.id,aws_security_group.acceso-http-sg.id]
  subnet_id              = aws_subnet.Public-subnet-2.id
  provisioner "file" {
  source      = "./proxy-conf.conf"
  destination = "/etc/nginx/conf.d/proxy-conf.conf"

  connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("/home/pablo/.ssh/id_rsa")
    host     = self.public_ip
  }
  }
  provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("/home/pablo/.ssh/id_rsa")
    host     = self.public_ip
    }
    inline = [
      "sudo -i",
      #"yum -y update",
      "yum install -y epel-release",
      "yum install -y nginx",
      "systemctl enable nginx",
      #"firewall-cmd --zone=public --permanent --add-service=http",
      #"firewall-cmd --zone=public --permanent --add-service=https",
      #"firewall-cmd --reload",
      "sytemctl start nginx"
    ]
    }
  tags = {
    Name      = "Proxy-2-ec2"
    terraform = "True"

  }
}