#!/bin/zsh

function rmtemp {
rm -rf -- $Temp
exit 130
#Exits with the return code of a control c
}


export Temp=`mktemp -d`
export UserStoredLoc="$HOME/.adcrack/"
export RootStoredLoc="/etc/adcrack/"
export TempMerged="$Temp/Merged
#Creates a default file if not exist
#{
export Defaults="https://easylist-downloads.adblockplus.org/easylist.txt
https://spam404bl.com/spam404scamlist.txt
https://easylist-downloads.adblockplus.org/malwaredomains_full.txt
http://easylist-downloads.adblockplus.org/easyprivacy.txt"
#}

#Create does the actual file
#{
if [ -e ! "$RootStoredLoc" ] && [ ! -s "$RootStoredLoc" ]; then
	if [ -w "$RootStoredLoc" ]; then
	mkdir -P -- $RootStoredLoc
	echo $Defaults > $RootStoredLoc
	fi
fi
#}
echo $Defaults > $UserStoredLoc
cat -- $UserStoredLoc $RootStoredLoc > $TempMerged
wget -P $Temp -i $TempMerged --
cat "$Temp/*" | uniq > "$Temp/adblock.txt"
#In the event of an unexpected exit, this script removes the temp dir
#{
trap -- 'rmtemp' EXIT
trap -- 'rmtemp' SIGHUP
trap -- 'rmtemp' SIGINT
trap -- 'rmtemp' SIGQUIT
trap -- 'rmtemp' SIGTERM
#}
