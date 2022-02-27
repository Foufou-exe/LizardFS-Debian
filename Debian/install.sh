#!/bin/bash -e
# UTF-8 encoded

#<------------ Importing Scripts ------------>

# Declaration of the Paths of other scripts in the Script_PATH variables

Script_PATH1="~/LizardFS-Debian/Debian/Master.sh"
Script_PATH2="~/LizardFS-Debian/Debian/Chunk.sh"
Script_PATH3="~/LizardFS-Debian/Debian/Chunk_MetaLogger.sh"
Script_PATH4="~/LizardFS-Debian/Debian/Shadow.sh"
Script_PATH5="~/LizardFS-Debian/Debian/Client.sh"
Script_PATH6="~/LizardFS-Debian/Debian/host.sh"


#<------------ Calls declared Variables ------------>

#   Declaration of the new variables which will have the name of the scripts which will have been retrieved via the variables above

Master=$"$Script_PATH1"
Chunk=$"$Script_PATH2"
Chunk_MetaLogger=$"$Script_PATH3"
Shadow=$"$Script_PATH4"
Client=$"$Script_PATH5"
host=$"$Script_PATH6"

#<------------ Calls up Functions ------------------->

function main {  #   Main function: This will declare the other functions to make the scripts work
    hostname
    pre-requis
    echo $host
    list_install
    choix_list_install
}

function pre-requis {   #   Pre-requisite function: It will aim at gathering the necessary installation
    echo "Launching the installation script 👌"  # We say we run the script
    sleep 1 # Wait a second
    echo "Installation of the prerequisites 🎈" # We say we install the prerequisites
    sleep 1 # Wait a second
    apt-get install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip  #  We install the packages we need
    apt-get update -y && apt-get upgrade -y     # We update and upgrade the bone system
    echo "deb [trusted=yes] http://packages.lizardfs.com/ubuntu/$(lsb_release -sc) $(lsb_release -sc) main" >/etc/apt/sources.list.d/lizardfs.list  # Echo 1: we give the link of the package and we put it in the lizadfs.list file
    echo "deb-src http://packages.lizardfs.com/ubuntu$(lsb_release -sc) $(lsb_release -sc) main">>/etc/apt/sources.list.d/lizardfs.list # Echo 2: We do the same as echo 1 but add debian-src 
    apt-get -y update # We update the system
    sleep 1 # Wait a second
    echo "Installed prerequisites 😊" # Echo 3: The prerequisites are said to be installed
}

function hostname { #   Hostname function: It aims to set the hostname according to the user's choice
    read -p "Choose the name of the machine ? :" name   #   Read: The user is asked to give the name of the machine and this value will be stored in the variable $Name
    hostname set-hostname $name #   The hostname is given and on system restart the name will be saved
    hostname $name  #   The hostname will be applied temporarily
}

function list_install { #   ListInstall function: It aims to give a list, like a menu
    echo -e "\nInstallation on ? :"
    echo -e "1) Master"
    echo -e "2) Chunk"
    echo -e "3) Metalogger"
    echo -e "4) Shadow"
    echo -e "5) Client"
    echo -e "6) Exit\n"
}

function choix_list_install {   #   ChoixListInstall function: It is intended to allow the selection of the installation option from thelist
    read -n1 -p "Choose option (1-5) : " Action_main #   Read 4 : The user is asked to choose an option and the value given will be taken by the Action_main variable
    if [ "$Action_main" == "1" ]; then  #   Condition : If the user chooses 1 then it echoes $master
       echo $Master     #   Echo 1 : it will return what is in the variable $Master that is to say the script Master.sh
    elif [ "$Action_main" == "2" ]  # Elif 1 : If the user chooses 2 then it echoes $Chunk
        echo $Chunk     #   Echo 2 : it will return what is in the variable $Chunk that is to say the script Chunk.sh
    elif [ "$Action_main" == "3" ]  # Elif 2 : If the user chooses 3 then it echoes $Chunk_MetaLogger
        echo $Chunk_MetaLogger    #   Echo 3 : it will return what is in the variable $Chunk_MetaLogger that is to say the script Chunk_MetaLogger.sh
    elif [ "$Action_main" == "4" ]  # Elif 3 : If the user chooses 4 then it echoes $Shadow
        echo $Shadow    #   Echo 4 : it will return what is in the variable $Shadow that is to say the script Shadow.sh
    elif [ "$Action_main" == "5" ]  # Elif 4 : If the user chooses 5 then it echoes $Client
        echo $Client    #   Echo 5 : it will return what is in the variable $Client that is to say the script Client.sh
    elif [ "$Action_main" == "6" ]  # Elif 5 : If the user chooses 6 then go to exit
        exit     # It comes out of the script
    else # Else : The user is mistaken so we will return an echo
    echo "Incorrect,Retry 😓!" # Echo 6 : He says it is incorrect !!
        choisir_categorie_main #    Use of the choisir_categorie_main
    fi # End of Condition
}

# <------------ Running the script ------------>

main # Utility function to run the script
