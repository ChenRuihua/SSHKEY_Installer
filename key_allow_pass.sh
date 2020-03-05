#/bin/sh
apt-get update -y
apt-get install curl -y
yum clean all
yum make cache
yum install curl -y
echo '============================
      SSH Key Installer
	 V1.0 Alpha
	Author:Kirito
============================'
cd ~
mkdir .ssh
cd .ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdeKR+AiTcp/3iT+tSEa0XvE9Svb4mj8a0C6YIRGX3d8WKNm9Aaf/mXXJEdglFkJyTM+VXFSCkdS1bAEVTEkojAxEL4l5IiGjEOI9DLCS1v+6l0NozQB6ULC3BIoIazsf31uj1qIN+NJa8m69db2gfXp711Db0H5mF3CVHbxT5VQeI1/UV0lJ1kZ6l5aS7lU33o8McGT2W3NzkYlTPVIxzlApLb0qrmPgbFqDIaYFeB4LjHVjyzHga4qxEpUUil3Gfy5s1IXwCQaG6SIJiqga2wbBhgOYzn/PP7hl+YlzLjnb/aTi+i4tsXm4plDNMj+Eu113Lnhk1DAuvus+sQH+V' > authorized_keys
chmod 700 authorized_keys
cd ../
chmod 600 .ssh
cd /etc/ssh/

sed -i "/PasswordAuthentication no/c PasswordAuthentication yes" sshd_config
sed -i "/PasswordAuthentication yes/c PasswordAuthentication yes" sshd_config
sed -i "/RSAAuthentication no/c RSAAuthentication yes" sshd_config
sed -i "/RSAAuthentication yes/c RSAAuthentication yes" sshd_config
sed -i "/PubkeyAuthentication no/c PubkeyAuthentication yes" sshd_config
sed -i "/PubkeyAuthentication yes/c PubkeyAuthentication yes" sshd_config

service sshd restart
service ssh restart
systemctl restart sshd
systemctl restart ssh
cd ~
rm -rf key.sh
