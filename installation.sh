#!/bin/bash

install_all_files () {
	cp config-files/.zshrc ~/
	if [ $? == 0 ] 
	then
		echo "[+]${LBLUE} .zshrc succesfully moved\n"
	else
		echo "[-]${RED} something went wrong while copying .zshrc\n"
	fi
	
	cp config-files/.bashrc ~/
	if [ $? == 0 ] 
	then
		echo "[+]${LBLUE} .bashrc succesfully moved\n"
	else
		echo "[-]${RED} something went wrong while copying .bashrc\n"
	fi

	cp config-files/.gitconfig ~/
	if [ $? == 0 ] 
	then
		echo "[+]${LBLUE} .gitconfig succesfully moved\n"
	else
		echo "[-]${RED} something went wrong while copying .gitconfig\n"
	fi

	if [ ! -d "~/.config/nvim/" ] 
		if [ ! -d "~/.config/" ] 
			echo "[-]${RED}"
		fi
	fi
	cp config-files/init.vim
	if [ $? == 0 ] 
	then
		echo "[+]${LBLUE} .zshrc succesfully moved\n"
	else
		echo "[-]${RED} something went wrong while copying .zshrc\n"
	fi
}

#-------------------------CONSTANTS---------------------
RED='\033[0;31m'		# red 
GREEN='\033[0;32m'		# green 
CYAN='\033[0;36m'		# cyan
LBLUE='\033[1;34m'		# light blue
NC='\033[0m'			# no color

# --------------------------CODE-------------------------
clear
figlet -c -t -k -p -w 100 Config Installation

echo -e "\n\n${LBLUE}These is an installation script${NC}\n
${GREEN}Here you will choose, which files do you want to install.
To install:
\t- all files in all directiories - enter 0
\t- only all configuration files - enter 1
\t- only all shell scripts - enter 2
\t- follow all files one-by-one and coose manualy, which to install - enter 3
\t- if you want to manualy write the names of scripts - enter 4"
echo -e "${CYAN}\nIt's time to choose: ${NC}"
read ch

case $ch in
	0) 
	echo "ok"
	install_all_files
	;;

	1)
	echo "ok2"
	;;

	2)
	echo "ok3"
	;;

	3)
	echo "ok4"
	;;

	4)
	echo "ok5"
	;;

	?)
	echo "[-]${CYAN} Man, read the desciption again, to whom did I write it, huh?"
	;;
esac
