#!/bin/bash

red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;96m'
no='\e[0m'        
mailuser=user@gmail.com:password

if [[ $EUID -eq 0 ]]; then
  echo -e ${piros}"Run as not root!"${no} 1>&2
  exit 1
fi

# update the source list and upgrade the packages
sudo apt-get -yq update
sudo apt-get -yq upgrade

# add package names to array below you want to install them
apps=(
#default
"htop"
"mc"
"net-tools"
#kell a ServerInfo programunk működéséhez
"sysstat"
)

for app in "${apps[@]}"
do
    echo -e ${green}">>> >>> >>> $app start install"${no}
    sudo apt-get -yq install $app
    echo -e ${blue}">>> >>> >>> $app installed."${no}
    sleep 2
done

#----------------------------------------------------------------------------------------


#keres csere minta
#sudo sed -i 's/tooltip_bg_color:#000000/tooltip_bg_color:#f5f5b5/g' $path/$theme/gtk-3.0/settings.ini

#fajl letrezozas minta
#lines=(
#"blablabla"
#)

#sudo touch /etc/fajl.ini
#for line in "${lines[@]}"
#do
#    sudo sh -c "echo ${line} >> /etc/fajl.ini"
#done


#OK
echo -e ${blue}"Installation completed."${no}


