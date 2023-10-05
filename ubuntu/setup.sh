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
ter=("xterm")
sr=("firefox" "snap-store")
ar=( "snapd" "gnome-text-editor" "gnome-system-monitor" "nano" "gnome-terminal")
base=("flatpak" "python3-pip" "aria2" "curl" "tilix" "nala" "vim")
media=("vlc" "mpv" "ffmpeg")
ess=("build-essential" "flameshot" "python-is-python3" "zsh")
nix=("nixpkgs.firefox" "nixpkgs.neovim")
flat=("com.spotify.Client" "com.obsproject.Studio")
restricted=("libavcodec-extra" "ttf-mscorefonts-installer" "unrar" "gstreamer1.0-libav" 
"gstreamer1.0-plugins-ugly" "gstreamer1.0-vaapi" "chromium-codecs-ffmpeg-extra")
dev=("code")

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


# This here is not recomended to change
# This copying the bashrc to the Home directory 
# Same thing goes for the zshrc 
# Then there is the it is going to source the zshrc and the bashrc.
# IF it all runs correctly 
# cp "$bash" "$HOME" && cp "$zsh" "$HOME" 

# This will copy the sources.list to the location contained in the varriable.
# Then update the repo with out user prompt.
# You can change these if you wish you can edit the sources to install your packages 
# You can change apt to have user prompt by removing -y 
# if you wish  
# cp sources.list "$sour" && apt-get update -y && apt-get upgrade -y
snap remove "${sr[@]}" && apt-get remove "${ar[@]}" -y

apt-get install "${base[@]}" "${media[@]}" "${ess[@]}" "${restricted[@]}" -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub "${flat[@]}" -y 

aria2c https://az764295.vo.msecnd.net/stable/e7e037083ff4455cf320e344325dacb480062c3c/code_1.83.0-1696350811_amd64.deb

sudo dpkg -i *.deb

sudo apt-get install -f 

sh <(curl -L https://nixos.org/nix/install) --daemon && apt-get install "${ter[@]}"

