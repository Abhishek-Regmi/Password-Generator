#!/bin/bash
echo -e "
					    _    ____  _   _ ___ ____  _   _ _____ _  __
					   / \  | __ )| | | |_ _/ ___|| | | | ____| |/ /
					  / _ \ |  _ \| |_| || |\___ \| |_| |  _| | ' / 
					 / ___ \| |_) |  _  || | ___) |  _  | |___| . \ 
					/_/   \_\____/|_| |_|___|____/|_| |_|_____|_|\_\ "

#Making a helpful user friendly password generator
#Arguments are [-w | weak] [--weak | weak] [-m | medium] [--medium | medium] [-s | strong] [--strong | strong]  
function usage(){
	echo "[-w | weak] [--weak | weak] [-m | medium] [--medium | medium] [-s | strong] [--strong | strong] " 

}
if [ $# -ne 1 ]; then
	{
	echo "You need to give one argument"
	usage
	echo "Example: $0 -w"
	echo "Example: $0 -m"
	echo "Example: $0 -s"
	exit 1
	
}
fi
while [ $# -gt 0 ]
do

	case "$1" in
		-w|--weak )
			echo "Enter the length of your PASSWORD: "
			read pass_len1
			gen=$(gpw 1 "$pass_len1")
			echo " The PASSWORD is:      $gen"
			
			shift
			shift



			;;
		-m|--medium )
			echo "Enter the length of your PASSWORD: "
			read pass_len2

			for p in $(seq 1);
			do
			openssl rand -hex 48 | cut -c1-$pass_len2	
			done	
			shift
			shift



			;;


		-s|--strong )
			echo "Enter the length of your PASSWORD you want to create: "
			read pass_len3
			for p in $(seq 1);
			do
			openssl rand -base64 48 | cut -c1-$pass_len3
			done
			shift
			shift


			;;


		* )
			usage
			shift
			;;
	esac
done


