resource "aws_security_group" "sg_vitalpbx" {
  name        = "sg_vitalpbx"
  description = "Server vitalpbx"
  vpc_id = aws_vpc.vitalpbx.id
  
  tags = {
    Name = "vitalpbx_gs"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5060
    to_port     = 5061
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10000
    to_port     = 20000
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "vitalpbx-subnet-group"
  subnet_ids = [aws_subnet.vitalpbx_subnet_privada.id ]  #if multi AZ add another subnet
}

resource "aws_security_group" "sg_rds_vitalpbx" {
  name        = "vitalpbx-db-sg"
  vpc_id = aws_vpc.vitalpbx.id
  ingress {
    from_port   = 3306  # MySQL port
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_vitalpbx.id]
  }
}