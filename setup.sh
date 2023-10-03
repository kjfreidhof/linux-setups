#!/bin/bash

set -e

rem=("qterminal" "nano" "mousepad")
inst=("terminator" "nala")
sour="/etc/apt"

cp sources.list "$sour" && apt-get update -y


if ! which "${rem[@]}" >> /dev/null; then
	apt-get install "${inst[@]}" -y 
	

else
	apt-get remove "${rem[@]}" -y && apt-get install "${inst[@]}" -y 
	 


fi 

exit 

	
