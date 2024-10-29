#!/bin/bash
echo "                                  "
echo "                                  "
echo "     ..........................  "
echo "     .. ||\\\   ||==|| ====== ..  "                   
echo "     .. ||  \\\ ||  ||   ||   ..  "		
echo "     .. ||  \\\ ||  ||   ||   ..  " 
echo "     .. ||\\\   ||==||   ||   ..  "	
echo "     ..........................  "
echo "                                  "
echo "                                  "

echo "     DOT is a simple dotfiles manager "
echo "                                    "
echo "Select an option pressing a button: "
echo "1) I to install the dotfiles in the current directory on this machine " 
echo "2) F to fetch dotfiles on this machine and place them in this folder "
echo "3) P to push the dotfiles in the current directory in a GitHub Repo "  
echo "                                                                       "
echo "           "

home_directory="$HOME/.config"
current_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
modules=("hypr" "kitty" "neofetch" "rofi" "waybar")


read operation

if [[ "$operation" == "I" ]]; then
	for mod in "${modules[@]}"; do
                echo "Copying $mod"
                cp -r "$current_directory/$mod" "$home_directory/$mod"
        done

        echo "$current_directory => $home_directory"
        echo "DONE"


elif [[ "$operation" == "F"  ]]; then
	for mod in "${modules[@]}"; do
		echo "Copying $mod"
		cp -r "$home_directory/$mod" "$current_directory/$mod"	
	done

	echo "$home_directory  => $current_directory"
	echo "DONE"


elif [[ "$operation" == "P" ]]; then
	echo "ss"
else
	echo " "
	echo "Invalid option, press a key to retry"
	read key
clear
exec sh "$0" "$@"

fi

