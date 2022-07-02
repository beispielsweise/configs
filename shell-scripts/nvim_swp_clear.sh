#!/bin/bash

cd ~/.local/share/nvim/swap
rm *.swp
if [ $nesCreated == 0 ]
then
	echo	[+] .swp files deleted
else
	echo	[-] an error occured, nothing to delete
fi
