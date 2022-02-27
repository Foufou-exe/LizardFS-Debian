#!/bin/bash -e
# UTF-8 encoded

#<-------------- Declaration of the Function -------------->

function install {
    apt install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip
    apt update -y
    apt upgrade -y
    echo 'deb [trusted=yes] https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    echo 'deb https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    apt -y update
    apt source lizardfs
    apt install -y lizardfs-common lizardfs-master lizardfs-cgiserv lizardfs-adm
    cp /var/lib/lizardfs/metadata.mfs.empty /var/lib/lizardfs/metadata.mfs
    cp /usr/share/doc/lizardfs-master/examples/mfsmaster.cfg /etc/lizardfs/mfsmaster.cfg
    read -p "Donner l'ip du Master : " Address
    sed -i "s/#PERSONALITY = shadow/PERSONALITY = shadow/; s/#MASTER_HOST =/MASTER_HOST = $Address/; s/#WORKING_USER = lizardfs/WORKING_USER = lizardfs/; s/#WORKING_GROUP = lizardfs/WORKING_GROUP = lizardfs/; s/#EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/; s/#DATA_PATH = /var/lib/lizardfs/DATA_PATH = /var/lib/lizardfs/" /etc/lizardfs/mfsmaster.cfg
    cp /usr/share/doc/lizardfs-master/examples/mfsexports.cfg /etc/lizardfs/mfsexports.cfg
    cp /usr/share/doc/lizardfs-master/examples/mfsgoals.cfg /etc/lizardfs/mfsgoals.cfg
    sed "s/# 15 default_xor3 : $xor3/15 default_xor3 : $xor3/" /etc/lizardfs/mfsgoals.cfg
    service lizardfs-master start
    service lizardfs-cgiserv start
}

#<-------------- Running the script -------------->

install