#!/bin/bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

# Packages
# Linux Packages
echo -e "${PURPLE}Do you want to setup linux and install necessary packages? [y/n] ${NOCOLOR} \n"
read initLinuxVar
if [ "${initLinuxVar}" == "y" ] || [ "${initLinuxVar}" == "Y" ] || [ "${initLinuxVar}" == "yes" ] || [ "${initLinuxVar}" == "YES" ]; 
then
	echo -e "${RED}You Took the RED PILL! :)${NOCOLOR} \n"
	sudo apt install -y \
	zsh git curl wget build-essential default-jdk libboost-all-dev cmake cmake-qt-gui \
	qt5-default qtcreator libeigen3-dev libarmadillo-dev python3-pip python3.8 \
	clang clang-format clang-tidy clang-tools libopencv-dev opencv-data opencv-doc \
	openssh-server filezilla texlive-full texmaker texmaker-data texstudio texstudio-doc \
	java-common gradle
else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
fi

#Config Java
echo -e "${PURPLE}Do you want to configure Java to Amazon Corretto 11? [y/n] ${NOCOLOR} \n"
read javaInitVar
if [ "${javaInitVar}" == "y" ] || [ "${javaInitVar}" == "Y" ] || [ "${javaInitVar}" == "yes" ] || [ "${javaInitVar}" == "YES" ]; 
then
	echo -e "${RED}You Took the RED PILL! :)${NOCOLOR} \n"
	wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
 	sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
	sudo apt-get update; sudo apt-get install -y java-11-amazon-corretto-jdk;
	sudo update-alternatives --config java;
	sudo update-alternatives --config javac;
else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
fi


# Python Packages
echo -e "${PURPLE}Do you want to setup python3 packages and make  pip local? [y/n] \n ${NOCOLOR}"
read pythonInstall
if [ "${pythonInstall}" == "y" ] || [ "${pythonInstall}" == "Y" ] || [ "${pythonInstall}" == "yes" ] || [ "${pythonInstall}" == "YES" ]; then
	echo -e "${RED}You Took the RED PILL! :)${NOCOLOR} \n"
	python3.8 -m pip install --user -U \
	numpy scipy matplotlib ipython jupyter pandas sympy nose scikit-learn
	python3.8 -m pip install --user -U pip
else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
fi
# oh my zsh installation
echo -e "${PURPLE}Do you want the oh-my-zsh and set as default? [y/n] \n ${NOCOLOR}"
read zshInstall
if [ "${zshInstall}" == "y" ] || [ "${zshInstall}" == "Y" ] || [ "${zshInstall}" == "yes" ] || [ "${zshInstall}" == "YES" ]; then
	echo -e "${RED}You Took the RED PILL! :)${NOCOLOR} \n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# zsh configs
	"prompt_context(){}" >> ~/.zshrc
	# copy zshrc to home
 	cp ./zshrc ~/.zshrc
else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
fi

 
 
 #install cuda
 echo -e "${PURPLE}Do you want to install CUDA 11 with Nvidia Drivers? [y/n] \n ${NOCOLOR}"
 read cudaInstall
 if [ "${cudaInstall}" == "y" ] || [ "${cudaInstall}" == "Y" ] || [ "${cudaInstall}" == "yes" ] || [ "${cudaInstall}" == "YES" ]; then
 	echo -e "${RED}You Took the RED PILL! :)${NOCOLOR} \n"
 	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
 	sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
 	sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
 	sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
 	sudo apt-get update
 	sudo apt-get -y install cuda
 else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
 fi
 
 #For Gnome3
 echo -e "${PURPLE}Do you want to set GNOME as your desktop enviornment? [y/n] \n ${NOCOLOR}"
 read gnomeInstall
 if [ "${gnomeInstall}" == "y" ] || [ "${gnomeInstall}" == "Y" ] || [ "${gnomeInstall}" == "yes" ] || [ "${gnomeInstall}" == "YES" ]; then
 	echo -e "${RED}You Took the RED PILL! :)${NOCOLOR} \n"
 	sudo apt install -y gnome-session gdm3
 	sudo update-alternatives --config gdm3-theme.gresource
 else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
 fi

# Install Spotify
echo -e "${PURPLE}Do you want to install Spotify? [y/n] \n ${NOCOLOR}"
read spotifyVar
if [ "${spotifyVar}" == "y" ] || [ "${spotifyVar}" == "Y" ] || [ "${spotifyVar}" == "yes" ] || [ "${spotifyVar}" == "YES" ]; then
 	echo -e "${GREEN}You Took the Green PILL! :)${NOCOLOR} \n"
	curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update && sudo apt-get install spotify-client
 else
	echo -e "${BLUE}You took the blue pill.\n ${NOCOLOR}"
 fi







echo -e "${GREEN}Initialization and Setup was done. Enjoy Amir. :) ${NOCOLOR}"
