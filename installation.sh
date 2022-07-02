#!/bin/bash

install_files () {
	if [ ch == 0 ]
	then
		echo "OK"
	fi


	# ------------------------ CONFIGS -----------------------
	# .zshrc
	cp config-files/.zshrc ~/
	if [ $? == 0 ] 
	then
		echo -e "[+]${LBLUE} .zshrc succesfully copied${NC}"
	else
		echo -e "[-]${RED} something went wrong while copying .zshrc${NC}"
	fi
	
	# .bashrc
	cp config-files/.bashrc ~/
	if [ $? == 0 ] 
	then
		echo -e "[+]${LBLUE} .bashrc succesfully copied${NC}"
	else
		echo -e "[-]${RED} something went wrong while copying .bashrc${NC}"
	fi

	# .gitconfig
	cp config-files/.gitconfig ~/
	if [ $? == 0 ] 
	then
		echo -e "[+]${LBLUE} .gitconfig succesfully copied${NC}"
	else
		echo -e "[-]${RED} something went wrong while copying .gitconfig${NC}"
	fi

	# init.vim
	if [[ ! -d "~/.config/nvim/" && "~/.config/nvim/" =~ ^\. ]]
	then
		echo -e "[-]${RED} No directory path \"~/.config/nvim\", which is essential for NEOVIM configuration\n
Please, check if all necessary folders exist${NC}"
	else
		cp config-files/init.vim ~/.config/nvim/
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} init.vim succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying init.vim${NC}"
		fi
	fi

	# alacritty.yml 
	if [[ ! -d "~/.config/alacritty/" && "~/.config/alacritty/" =~ ^\. ]]
	then
		echo -e "[-]${RED} No directory path \"~/.config/alacritty/\", which is essential for NEOVIM configuration\n
		Please, check if all necessary folders exist${NC}"
	else
		cp config-files/alacritty.yml ~/.config/alacritty/
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} alacritty.yml succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying alacritty.yml${NC}"
		fi
	fi
	
	# ------------------------ SCRIPTS -----------------------
	# nes_o.sh
	echo -e "${GREEN}Sudo commands folowing:${NC}"
	sudo cp shell-scripts/nes_o.sh /bin/
	if [ $? == 0 ] 
	then
		echo -e "[+]${LBLUE} script nes_o.sh succesfully copied${NC}"
	else
		echo -e "[-]${RED} something went wrong while copying script nes_o.sh${NC}"
	fi

	# nvim_swp_clear.sh
	sudo cp shell-scripts/nvim_swp_clear.sh /bin/
	if [ $? == 0 ] 
	then
		echo -e "[+]${LBLUE} script nvim_swp_clear.sh succesfully copied${NC}"
	else
		echo -e "[-]${RED} something went wrong while copying script nvim_swp_clear.sh${NC}"
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

clear
echo -e "${GREEN}Installation proces began...${NC}\n\n"

case $ch in
	0) 
	install_files
	echo -e "\n\n${LBLUE}All files installed.\n 
	\t${RED}!!!!!!!!!!!! YOU NEED TO SET CHMOD +X FOR ALL SCRIPTS !!!!!!!!!!!! ${NC}"
	;;

	1)
	echo -e "$\n\n{LBLUE}All config files are installed${NC}"
	;;

	2)
	;;

	3)
	;;

	4)
	;;

	?)
	echo -e "[-]${CYAN} Man, read the desciption again, to whom did I write it, huh?"
	;;
esac
