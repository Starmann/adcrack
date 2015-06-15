#!/bin/sh
#This script is designed generate a newer version of the script in case I didn't
#Update it yet
alias wget='wget --no-check-certificate'
mkdir ../tmp
cd ../tmp
wget https://easylist-downloads.adblockplus.org/easylist.txt
wget https://spam404bl.com/spam404scamlist.txt
wget https://easylist-downloads.adblockplus.org/malwaredomains_full.txt
wget http://easylist-downloads.adblockplus.org/easyprivacy.txt
cat *.txt|uniq > ../adblock.txt
rm -r ../tmp
