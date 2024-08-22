# Crear una base de datos MySQL en AWS RDS
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name                 = "bdvitalpbx"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "p4ssw0rd"  
  vpc_security_group_ids = [aws_security_group.sg_vitalpbx.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = true
  tags = {
        Name = "ec2_to_mysql_rds"
    }
}


# Salida de la URL de conexión de la base de datos
output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}