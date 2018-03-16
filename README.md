#apt full remove:
#apt-get purge <package-name>
#or
#apt-get remove --purge <package-name>

#apt install reinstall config file:
#apt-get -o Dpkg::Options::="--force-confmiss" install --reinstall <package-name>

#Samba adduser:
#smbpasswd -a <username>

#Tar tömörítés:
#tar:
#  be: tar -cvf file.tar ./*
#  ki: tar -xvf file.tar
#gz:
#  be: tar -czvf file.tar.gz ./*
#  ki: tar -xzvf file.tar .gz

#Elérési úthoz (path) felvenni egy útvonalat a bashrc -ben
#PATH="$PATH:/DietPi/dietpi"

#Windows 10 Ubuntu shell
#Mount külső megosztás
#mount -t drvfs '\\piserver\hdd' /mnt/share
#umount /mnt/share

#Mount külső HDD
#(ntfs fájlrendszer install)
#sudo apt-get install ntfs-3g

#sudo fdisk -l
#sudo mount -t ntfs /dev/sda1 /mnt/hdd1
#sudo umount /dev/sda1

#Automata belépés "sudo -s" -el
#sudo visudo paranccsal egyébként az /etc/sudoers -ben van
#usernev[tab]ALL=(ALL:ALL)[space]NOPASSWD:[tab]ALL
#ki kellvenni a rendszergazda csoportból a felhasználót ha kér még jelszót a rendszer
#lista ki van sudo csoportban:
#grep '^sudo:.*$' /etc/group | cut -d: -f4
#sudo csoportból kivétel:
#sudo deluser username sudo

#Karakteres képek: figlet, showfigfonts-al listázható milyen fontok vannak
#toilet -f mono12 -F metal PiServer

#Upgrading Ubuntu via Command Line:
#sudo apt-get update
#sudo apt-get upgrade
#sudo apt-get dist-upgrade

#Then begin the upgrade process:
#sudo apt-get install update-manager-core
#sudo do-release-upgrade

#titkosítás
#Encrypt
# tar -cz fájl_vagy_könyvtár|openssl aes-256-cbc -salt -out file.tar.gz.aes
#Decrypt
# openssl aes-256-cbc -d -salt -in file.tar.gz.aes | tar -xz

#Apache servernél, hogy menjen az újraindítás:
#/etc/apache2/apache2.conf file végére hozzáfűzni:
#ServerName localhost

#Apache wordpress:
#/etc/apache2/sites-available/000-default.conf -ba
#DocumentRoot /var/www/html
#alá:
#<Directory /var/www/html>
#  AllowOverride All
#</Directory>

#apache újraindítása:
#sudo apache2ctl graceful

#Wordpress clone
#Engedélyeznie kell az Apache modulok közül a rewrite_module -t,
#mert egyébként nem fut le a .htaccess-ban az átirányítás
#Phpmyadmin-ba egy új adattábla létrehozása:
#code esetén: blablabla_web, ide kell importálni a mentést
#find /var/www/ -type d -exec chmod 777 {} +
#find /var/www/ -type f -exec chmod 777 {} +
