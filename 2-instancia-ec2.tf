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

output "ec2_public_ip_vitalpbx" {
  description = "La dirección IP pública Servidor VitalPBX"
  value       = aws_instance.terraform.public_ip
}
