#!/bin/bash

mailuser=user@gmail.com:password

if [[ $EUID -eq 0 ]]; then
  echo -e "Run as not root!" 1>&2
  exit 1
fi

sudo apt-get -yq update
sudo apt-get -yq upgrade

# add package names to array below you want to install them
apps=(
"postfix mailutils libsasl2-2 ca-certificates libsasl2-modules"
)

for app in "${apps[@]}"
do
    sudo apt-get -yq install $app
    sleep 2
done

#postfix main.cf
lines=(
"# Set gmail as relay"
"relayhost = [smtp.gmail.com]:587"
"# Use TLS"
"smtp_use_tls = yes"
"# Use SASL"
"smtp_sasl_auth_enable = yes"
"# Path to password map file"
"smtp_sasl_password_maps = hash:/etc/postfix/sasl/passwd"
"# List of CAs to trust when verifying server certificate"
"smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
"# Eliminates default security options incompatible with gmail"
"smtp_sasl_security_options ="
"#csak a localhost-on figyeljen"
"inet_interfaces = loopback-only"
)

sudo touch /etc/postfix/main.cf
for line in "${lines[@]}"
do
    sudo sh -c "echo ${line} >> /etc/postfix/main.cf"
done

sudo sh -c "echo [smtp.gmail.com]:587 $mailuser > /etc/postfix/sasl/passwd"
sudo chmod 400 /etc/postfix/sasl/passwd
sudo postmap /etc/postfix/sasl/passwd
sudo rm /etc/postfix/sasl/passwd
sudo sed -i 's/;sendmail_path =/sendmail_path = \/usr\/sbin\/sendmail -t -i/g' /etc/php5/apache2/php.ini
