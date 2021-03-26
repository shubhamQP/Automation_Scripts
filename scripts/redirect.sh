#!/bin/bash
read -p 'Source : ' redirect
read -p 'Destination URL : ' URL
conf_path="/home/shubhamchavan/scripts/redirect.txt"
echo ""
echo "checking if entry is already there in conf file"
sleep 1
if [[ `grep -w "$redirect\|$URL" $conf_path` ]];
then	
	echo""
        echo "*********** Entry is present ***********"
	echo""
else
echo ""
echo "Destination URL : https://www.questionpro.com/$URL"
echo "Source : location ~* /$redirect"
echo ""
read -p  "Press Y to Confirm : " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then

echo "location ~* /$redirect {
        rewrite ^/$redirect https://www.questionpro.com/$URL/ permanent;
}" >> /home/shubhamchavan/scripts/redirect.txt

fi
fi
















