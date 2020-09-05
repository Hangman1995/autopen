#!/bin/bash

date=$(date +'%F %c' | tr -d " " | tr -d "PDT" | tr -d "2020"|tr -d "-" | cut -c3-)
ip="127.0.0.1"
cd /home/stig/Desktop/testing

map () {
        nmap -T5 -sV -oG $date-$ip $ip >/dev/null &
	for i in  find . -type f -cmin 1; do if [ $i == step1.sh ]; then echo "no no no"; fi; done
}

echo Input the IP of the box you are reconning? 
#read ip 
echo Scanning $ip...

map
for i in find . -type f -cmin 1;
	if i [ $i == step1.sh ];
		then echo "no no no"
	fi
done 


#grep -w open $results > grepresults

#awk '{print $5} $results' > final 
#awk '{print $6} $results' >> final

#cat final | sed -r 's/[//]|/_.g'


