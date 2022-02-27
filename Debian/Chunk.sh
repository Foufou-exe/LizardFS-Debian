#!/bin/bash -e

#<-------------- Declaration of the Function -------------->

function install { # This function: It aims to install the chunk
    apt-get install -y lizardfs-common lizardfs-chunkserver lizardfs-cgiserv xfsprogs gunzip
    gunzip -c /usr/share/doc/lizardfs-chunkserver/examples/mfschunkserver.cfg.gz >/etc/lizardfs/mfschunkserver.cfg 
    cp /usr/share/doc/lizardfs-chunkserver/examples/mfshdd.cfg /etc/lizardfs/mfshdd.cfg 
    modprobe -v xfs
    fdisk -l
    sed -e 's/\s([+0-9a-zA-Z]).*/\1/' << EOF | fdisk /dev/sdb
    n
    p
    1


    w
EOF
    echo "/dev/sdb1 /mnt/chunk1 xfs defaults 0 0">>/etc/fstab
	mkdir -p /mnt/chunk1 && mount /mnt/chunk1
    chown -R lizardfs:lizardfs /mnt/chunk1   
    echo "LIZARDFSCHUNKSERVER_ENABLE=true">>/etc/default/lizardfs-chunkserver
    echo "/mnt/chunk1">>/etc/lizardfs/mfshdd.cfg
    echo "Label = hdd1" /etc/lizardfs/mfschunkserver.cfg
    service lizardfs-chunkserver start
    service lizardfs-cgiserv start

}

#<-------------- Running the script -------------->

install