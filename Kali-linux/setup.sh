#!/bin/bash
# About: Oneshot hacker script 
# Author: Kyle Freidhof
# Created: October, 3 2023
# Note: This script is very customizable i have made it readable so anyone can come in here 
# and customize it just look out for the comments

# Recommended not to remove this it is to a caution in case a command in the script fails it
# wont keep runing
# exit if a command fails 
set -e

# An Array of packages that will be removed or installed
# set it to remove or install any of the packages you like 
# just modify the package names in quotes  
rem=("qterminal" "nano" "mousepad")
inst=("terminator" "nala" "vim")

# My Varriables that i will call out in the script 
# The sour varriable is set to the befault sources location in apt 
# This needed to get access to more packages in kali linux 
sour="/etc/apt"
# These are varriables for the bashrc and zshrc in kali linux 
# You can modify the bashrc and zshrc to your hearts desire. 
bash=".bashrc"
zsh=".zshrc"

# change this to your username mine is kali 
# Because im using the virtual machine image and the default username is kali
zshrc="/home/kali/.zshrc"
bashrc="/home/kali/.bashrc"


# This here is not recomended to change
# This copying the bashrc to the Home directory 
# Same thing goes for the zshrc 
# Then there is the it is going to source the zshrc and the bashrc.
# IF it all runs correctly 
cp "$bash" "$HOME" && cp "$zsh" "$HOME" && source "$zshrc" && . "$bashrc"

# This will copy the sources.list to the location contained in the varriable.
# Then update the repo with out user prompt.
# You can change these if you wish you can edit the sources to install your packages 
# You can change apt to have user prompt by removing -y 
# if you wish  
cp sources.list "$sour" && apt-get update -y


# if the packages in the rem array are not found
# Then it will install the packages in the inst array
if ! which "${rem[@]}" >> /dev/null; then
	apt-get install "${inst[@]}" -y 
	
# if they are found then it will remove the packages in rem array. 
# Then install the packages in the inst array.
# if the command runs correctly. 
else
	apt-get remove "${rem[@]}" -y && apt-get install "${inst[@]}" -y 
	 


fi 

exit 

	
