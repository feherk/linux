# other useful

# apt full remove:
apt-get purge <package-name>

#apt install reinstall config file:
apt-get -o Dpkg::Options::="--force-confmiss" install --reinstall <package-name>

#Samba adduser:
smbpasswd -a <username>
