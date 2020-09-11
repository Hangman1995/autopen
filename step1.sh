#!/bin/bash

# In progress with Hangman1995, Stigmatas, and FlyHigh
# We noticed after watching DefCon2020 that we spend a lot of time on reconning
# so we made  a script..

#dateformat for each individual file that we run this script for
date=$(date "+%Y-%m-%d_%H-%M_")
#ip used for testing
ip="127.0.0.1"
#this line will be used to check for the presence of the original file for git and if not make the dir
cd /home/stig/Desktop/testing

#Call the map function which  runs NMAP writes to a file and doesn't write to console
map () {
        nmap -T5 -sV -oG $date$ip $ip >/dev/null &
        #need to incorporate this for loop with if statement to access  last modified file for later variable declaration
        for i in  find . -type f -cmin 1; do if [ $i == step1.sh ]; then echo "no no no"; fi; done
}
#This section here is a placeholder for a possible webscraper.
echo Input the IP of the box you are reconning?
#read ip
echo Scanning $ip...

#Call the map function
map

filter_latest_scan () {
         ls -la 2020* | sort -r -n -t - -k 2
}


#grep for open ports from NMAP scan and appending them to new file for awking
#grep -w open $results > grepresults


#awking the grepresults file for the service and it's version
#awk '{print $5} $results' > final
#awk '{print $6} $results' >> final

#seding the final file to replace the / with _ and then plant to cut them
#cat final | sed -r 's/[//]|/_.g'
