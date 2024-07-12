resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  count                  = 2
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = <<-EOF
       #!/bin/bash
       sudo su
        dnf update -y
        dnf install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<html><h1> Welcome to Linux system for Web Server.</p> </h1></html>" >> /var/www/html/index.html
    EOF
  tags = {
    Name        = "instance-${count.index}"
    Environment = "dev"
    Provider    = "terraform"
  }
}
