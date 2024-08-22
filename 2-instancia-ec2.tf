# Lanza la instancia EC2
resource "aws_instance" "terraform" {
  ami                         = "ami-0ca5d57535dec1dbd" # Sustituye con la AMI de VitalPBX
  instance_type               = "t2.micro"             # Selecciona el tipo de instancia según tus necesidades
  key_name                    = "ClavesTaller"
  vpc_security_group_ids = [aws_security_group.sg_vitalpbx.id]
  subnet_id = aws_subnet.vitalpbx_subnet.id
  associate_public_ip_address = true
  user_data = "${file("vitalpbx.sh")}"

  tags = {
    Name = "Servidor VitalPBX"
  }

}

/*resource "aws_security_group_rule" "ec2_to_db" {
  type        = "ingress"
  from_port   = 3306  # MySQL port
  to_port     = 3306
  protocol    = "tcp"
  security_group_id = aws_security_group.sg_rds_vitalpbx.id  # RDS security group
  source_security_group_id = aws_security_group.sg_vitalpbx.id
}*/

output "ec2_public_ip_vitalpbx" {
  description = "La dirección IP pública Servidor VitalPBX"
  value       = aws_instance.terraform.public_ip
}
