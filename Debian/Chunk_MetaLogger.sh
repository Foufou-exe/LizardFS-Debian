#!/bin/bash -e
# UTF-8 encoded

#<-------------- Declaration of the Function -------------->

function install {  #   Install function: It is used to install a complete Chunk_MetaLogger
    apt install -y lizardfs-metalogger # Install lizardfs-metalogger
    cp /usr/share/doc/lizardfs-metalogger/examples/mfsmetalogger.cfg /etc/lizardfs/mfsmetalogger.cfg # Copy file mfsmettalogger to go and put it in the /etc/lizardfs/
    echo "LIZARDFSMETALOGGER_ENABLE=true">>/etc/default/lizardfs-metalogger # Echo : We add the following line to the lizardfs-metalogger file
    service lizardfs-metalogger start # We start the service lizard-metalogger
}

#<-------------- Running the script -------------->

install