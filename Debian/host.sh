#!/bin/bash -e
# UTF-8 encoded

#<---------- Declaration of Function ----------->

function config {   #Function config: The purpose of this function is to put the IPs and the host name we have chosen in the hosts file
    Config_host=True    #   Variable Config_host: it takes the true value
    while [ $Config_host ]; do  #   Loop: If the value of $Config_host is true then ⬇️
        echo -e "Configuration du fichier hôte 🤠\n"  # Echo 1: We say we're going to set up the host file
        read -n3 -p "You want to set up the Host File ?" rep # Read 1: We ask the user if he wants to set up the host file and the answer is that the value given will go into the variable $rep
        if [ "$rep" = "yes" ] || [ "$rep" = "y" ]; then #  Condition : If the value of $rep is yes/y then
            echo -e "\n" # Echo 2: A line break
            read -p "Please enter the IP and hostname: " rep2 #  Read 2: The user is asked to give IP and Hostname, so the values given will go into the variable $rep2
            echo -e "\n$rep2">>/etc/hosts  #  Echo 3: The value given in $rep2 will go into the host file
            sleep 1 #   Wait a second
            echo -e "\nModified Hosts file 😝"  #  Echo 4: It is said that the File has been modified
            sleep 2 #   Wait for 2 seconds
            echo -e "\nBack to the Hosts File Setup Menu 😶"    #  Echo 5: The user is told to return to the host file configuration menu
            sleep 1 #   Wait a second
            clear   #   We delete all the messages from before
        else    #   Otherwise, if the user has chosen something other than yes/y, then see the line below
            echo -e "\n" # Echo 6: A line break
            echo "You leave the Hosts File Setup Menu !!!😨😨"  # Echo 7: The user leaving the configuration menu is told
            sleep 2 #   Wait a 2 seconds
            exit  #  Exit the host file configuration menu
        fi # End to Condition
    done # End to script
}

#<------------ Use to Function -------------->

config