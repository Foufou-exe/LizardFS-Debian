#!/bin/bash -e
# UTF-8 encoded

#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {  #   Install function: Installs everything the master needs
    apt install -y lizardfs-common lizardfs-master lizardfs-cgi lizardfs-adm
    cp /var/lib/lizardfs/metadata.mfs.empty /var/lib/lizardfs/metadata.mfs
    cp /usr/share/doc/lizardfs-master/examples/mfsmaster.cfg /etc/lizardfs/mfsmaster.cfg
    sed -i "s/#PERSONALITY = master/PERSONALITY = master/; s/#WORKING_USER = lizardfs/WORKING_USER = lizardfs/; s/#WORKING_GROUP = lizardfs/WWORKING_GROUP = lizardfs/; s/#EXPORTS_FILENAME = /etc/lizardfs /mfsexports.cfg/EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/; s/#DATA_PATH = /var/lib/lizardfs /DATA_PATH = /var/lib/lizardfs /" /etc/lizardfs/mfsmaster.cfg
    cp /usr/share/doc/lizardfs-master/examples/mfsexports.cfg /etc/lizardfs/mfsexports.cfg
    cp /usr/share/doc/lizardfs-master/examples/mfsgoals.cfg /etc/lizardfs/mfsgoals.cfg
    sed "s/# 15 default_xor3 : $xor3/15 default_xor3 : $xor3/" /etc/lizardfs/mfsgoals.cfg
    service lizardfs-master start
    service lizardfs-cgi start

}

#<-------------- Running the script -------------->

install