#/bin/bash

##############################################################
# Attac Script executer, will log/display activities
# Ing. Alexander Poschenreithner, 2017
##############################################################

clear

echo "########################################################################"
echo "# Attack executer for all scripts within 'attac-scripts'"
echo "# `date`"
echo "########################################################################"
echo "# by Ing. Alexander Poschenreithner 2017"
echo "########################################################################"
echo 
echo 

# Empty log
echo "" > /tmp/attack.log


# Ping Syslog server to ensure its up and running
echo "Checking if Syslog-Server is up..."
if ping -c 1 10.11.12.15 &> /dev/null
then
  echo -e "  => \e[32mOK\e[0m"
  printf "\n\n"
else
  echo -e "  => \e[91mFAILED\e[0m"
  exit;
fi

# Ping target server to ensure its up and running
echo "Checking if target Server is up..."
if ping -c 1 10.11.12.10 &> /dev/null
then
  echo -e "  => \e[32mOK\e[0m"
  printf "\n\n"
else
  echo -e "  => \e[91mFAILED\e[0m"
  exit;
fi

# Check if dictionaries were created during attackers VM setup
echo "Checking dictionaries for Brute Force"
if [ -e /tmp/passwordlist_1.txt ] && [ -e /tmp/passwordlist_2.txt ]
then
    echo -e "  => \e[32mOK\e[0m"
else
    echo -e "  => \e[91mFAILED\e[0m"
  #exit;
fi


# Give scripts execution rights
echo "Preparing scripts..."
# Make scripts executeable
sudo chmod +x /vagrant_data/attack-scripts/*.sh
printf "  => DONE\n\n"


# Execute each attack in numerig order 
printf "Let's get the partey started! :-)\n"
for SCRIPT in /vagrant_data/attack-scripts/*
	do
		if [ -f $SCRIPT -a -x $SCRIPT ]
		then
			echo "########################################################################"
			echo "  => EXECUTING: $SCRIPT"

			printf "$SCRIPT\n\n" >> /tmp/attack.log
			
			$SCRIPT


			echo "########################################################################" >> /tmp/attack.log
			echo "  => DONE!"
			#echo "####################################"
			sleep 10
		fi
done
echo "########################################################################"
echo

# Move attack log to shared directory
mv /tmp/attack.log /vagrant_data/attack.log

echo -e "\e[5mAllright so weit!\e[0m All attacks have been executed! Don't forget to copy the pcap dump file from: ./logserver/share/  ;-)"
echo "For detailed information see attack.log"