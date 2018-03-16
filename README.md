#apt install reinstall config file:
apt-get -o Dpkg::Options::="--force-confmiss" install --reinstall <package-name>

#Samba adduser:
smbpasswd -a <username>
  
archive command:
tar:
  be: tar -cvf file.tar ./*
  ki: tar -xvf file.tar
gz:
  be: tar -czvf file.tar.gz ./*
  ki: tar -xzvf file.tar .gz
