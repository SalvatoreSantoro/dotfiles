#!/usr/bin/env bash
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
modules=(".zshrc" "sway" "hypr" "kitty" "neofetch" "rofi" "waybar" "wallpapers" "nvim")

read operation

if [[ "$operation" == "I" ]]; then
	for mod in "${modules[@]}"; do
                if [[ "$mod" == ".zshrc" ]];then
			cp "$current_directory/$mod" "$HOME"
		else	
                	cp -r "$current_directory/$mod" "$home_directory"        
		fi
		echo "Copying $mod" 
	done

        echo "$current_directory => $home_directory"
        echo "DONE"


elif [[ "$operation" == "F" ]]; then
	for mod in "${modules[@]}"; do
		if [[ "$mod" == ".zshrc" ]];then
			cp "$HOME/$mod" "$current_directory"
		else
			cp -r "$home_directory/$mod" "$current_directory"	
		fi
		echo "Copying $mod"
	done

	echo "$home_directory  => $current_directory"
	echo "DONE"


elif [[ "$operation" == "P" ]]; then
	current_date=$(date +"%a, %d %b %Y %H:%M:%S %z")
	echo "$current_directory"	
	cd "$current_directory" || exit	
	git add --all 
   	git commit -m "Commit of $current_date"
   	git push
	echo "Correctly pushed on GitHub!"

else
	echo " "
	echo "Invalid option, press a key to retry"
	read key
	clear
	exec sh "$0" "$@"
fi
