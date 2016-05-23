#!/bin/bash 
function download {
	for file in /Users/*; do
		if [ "${file##*/}" != "Shared" ]&&[ ${file##*/} != "Guest" ]&&[ ${file##*/} != "Deleted" ]&&[ ${file##*/} != "Users" ]; then
			OPTIONS+=( ${file##*/})
		fi
	done
	if [ "${#OPTIONS[@]}" == "1" ]; then
		echo "looks like you are the only user of this computer"
		USER=$OPTIONS
	else
		echo "Which user are you? (type a number and hit enter)"
		PS3="I am user number->"
		select opt in ${OPTIONS[@]}; 
		do
			if [ -z "${opt}" ];then
				echo "You chose an option outside of the choices :("
				echo "hint: you can hit the up arrow and enter"
				exit
				break
			fi
			USER=$opt
			break
		done
	fi
	cd /Users/${USER}/Library/Application\ Support/MobileSync/Backup/ || exit
	DIR=$(ls -t | head -1)
	cd /Users/${USER}/Library/Application\ Support/MobileSync/Backup/$DIR
	mkdir /Users/${USER}/Desktop/Textual_files || exit
	cp 31bb7ba8914766d4ba40d6dfb6113c8b614be442 /Users/${USER}/Desktop/Textual_files/31bb7ba8914766d4ba40d6dfb6113c8b614be442
	cp 3d0d7e5fb2ce288813306e4d4636395e047a3d28 /Users/${USER}/Desktop/Textual_files/3d0d7e5fb2ce288813306e4d4636395e047a3d28
	echo "files sucessfully copied! open up the folder on your desktop now"
	exit
}
download < /dev/tty