resource "aws_security_group" "instance_sg" {
  name        = "cicd-instance-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = "vpc-028da335662bcb02e"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Dilersen burayı sadece kendi IP adresinle sınırla
  }

  ingress {
    description = "HTTP"
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
    Name = "cicd-instance-sg"
  }
}
