#!/bin/sh

##############################################################
# NETCAT file transfer to "direct report upload" as found on the website during last attack
# Ing. Alexander Poschenreithner, 2017
##############################################################

# https://nakkaya.com/2009/04/15/using-netcat-for-file-transfers/

rm badcode.tgz

echo "     => Creating tgz from /share/netcat_file_content..."
env GZIP=-9 tar cvzf badcode.tgz -C /vagrant_data/netcat_file_content/ .
echo "     => Sending file over netcat on port 1234 to Server"
nc -w 3 10.11.12.10 1234 < badcode.tgz
echo "     => Sent!"
