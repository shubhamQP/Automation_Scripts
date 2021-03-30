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

sudo nginx -t
if [[ $? == 0 ]];
then
	echo "Success"
	echo "Restarting the nginx services"
	sleep 1
	if [[ `git diff | grep -w "diff --git"` ]]
	then
		echo "Restarting nginx service"
		#systemctl restart nginx
		echo "Commiting on to the git"
		echo""
		echo "Git block will run"
		echo""
	else
		echo "No diffrence"
	fi
else
	echo "Please check manually"
fi

fi
fi
















