#!/bin/bash -e
# UTF-8 encoded

#<-------------- Declaration of the Function -------------->

function install {  #   Install function: We install everything the customer needs
    apt install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip
    apt update -y && apt upgrade -y
    echo 'deb [trusted=yes] https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    echo 'deb https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    apt-get -y update
    apt-get source lizardfs
    apt-get install -y lizardfs-client
    mkdir /mnt/lizardfs
    mfsmount /mnt/lizardf
}

#<-------------- Running the script -------------->

install