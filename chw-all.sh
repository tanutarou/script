#!/bin/bash

if [ $# -ne 2 ]; then
	echo "usage: chw-all.sh before_str after_str"
	exit 1
fi


function yes_or_no_select(){
	echo -e "Did you backup your files?(You can't be restored.)(y|n)"
	read answer
	case $answer in
		y)
			echo -e "changed.\n"
			return 0
			;;
		n)
			echo -e "no change.\n"
			return 1
			;;
		*)
			echo -e "cannot understand your answer.\n"
			yes_or_no_select
			;;
	esac
}

if yes_or_no_select; then
	find ./ -type f | xargs sed -i "s/$1/$2/g"
fi
