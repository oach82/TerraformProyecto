#!/bin/bash
sudo cat /var/log/VitallInstall.log
cd /home/admin/ 
sudo echo "Iniciando Instalacion" >> /var/log/VitallInstall.log
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install sudo
sudo echo "Finalizando Actualizacion de sistema" >> /var/log/VitallInstall.log
sudo apt-get install wget -y
sudo wget https://repo.vitalpbx.com/vitalpbx/v4/apt/debian_vpbx_installer.sh
sudo echo "Descarga Instalador" >> /var/log/VitallInstall.log
sudo chmod +x debian_vpbx_installer.sh
sudo echo "Cambio Permisos" >> /var/log/VitallInstall.log
#sudo yes "yes" | ./debian_vpbx_installer.sh
sudo ./debian_vpbx_installer.sh
sudo echo "Finalizando Instalacion" >> /var/log/VitallInstall.log