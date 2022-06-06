#!/bin/bash

#
#   ████████╗███████╗██████╗ ██████╗ ██╗ █████╗ 
#   ╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██║██╔══██╗
#      ██║   █████╗  ██████╔╝██████╔╝██║███████║
#      ██║   ██╔══╝  ██╔══██╗██╔══██╗██║██╔══██║
#      ██║   ███████╗██║  ██║██║  ██║██║██║  ██║
#      ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝
#                    In aarch64
#				  By: JustEvil#3961
#
#
# This is my first script, so if you want to modify it
# in order to make it more optimized, cleaner and
# upgrade it, that's fine with me.
#
# This script is an idea from this post: 
# https://www.reddit.com/r/Terraria/comments/gl5fl8/guide_how_to_setup_a_terraria_14_server_on_a/
#

#
# THIS IS THE MONO PACKAGE VARIABLE
#
# Taken from there:
# https://stackoverflow.com/questions/1298066/how-can-i-check-if-a-package-is-installed-and-install-it-if-not
#
REQUIRED_PKG="mono-complete"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")

#
# THESE ARE THE TERRARIA SERVER VARIABLES
#
CONFIG="terraria.properties"
PORT="2005"

#
# [!] YOU CAN PLACE ANY PROPERTY, JUST
#     LEAVE THE -port AT THE END.
#
# Example "-motd motd.txt -seed randomseed -port"
#
PARAMETERS="-noupnp -port"


#
# TO SEARCH THE MACHINE'S ARCHITECTURE
# I think it is self-explanatory..
#
OS="$(uname -m)"
case "${OS}" in

	#
	# IF THE USER ARE USING AARCH64.
	#
    aarch64*)
		#
		# SEARCH THE MONO PACKAGE.
		#
		echo "[INFO] Checking for ${REQUIRED_PKG}: ${PKG_OK}"
	
		#
		# CHECK THE REQUIRED PACKAGE TO
		# START THE THERRARIA SERVER IN AARCH64.
		#
		if [ "" = "$PKG_OK" ]; then
			clear
			echo ""
			echo "[INFO] No ${REQUIRED_PKG}. Setting up ${REQUIRED_PKG}."
			echo ""
			sudo apt update && sudo apt install -y
			sudo apt install mono-complete -y
		fi
		clear
		echo "[INFO] Detected ${OS}! Removing mono's integrated stuff.."
		
		#
		# DETECT MONO'S INTEGRATED LIBRARIES
		# AND ANOTHER STUFF.
		#
		if [ -f "monoconfig" ]
		then
			echo "[INFO] Files found! Deleting.."
			#
			# THIS REDIRECTS THE "File not found" MESSAGE.
			#
			# Taken from there:
			# https://stackoverflow.com/questions/10247472/how-to-prevent-rm-from-reporting-that-a-file-was-not-found
			#
			rm System* 2> /dev/null
			rm Mono* 2> /dev/null
			rm monoconfig 2> /dev/null
			rm mscorlib.dll 2> /dev/null
		else
		
			#
			# IF THE FILES HAVE ALREADY BEEN DELETED,
			# THEY ARE SKIPPED AND THE SERVER IS STARTED DIRECTLY.
			#
			echo "[INFO] Files not found! Assuming that they no longer exist.."
		fi
		
		#
		# START THE SERVER PROCESS.
		#
		echo "[INFO] Everything seems ok! Starting.."
		mono --server --gc=sgen -O=all ./TerrariaServer.exe ${PARAMETERS} ${PORT} -config ${CONFIG}
	;;
	
	#
	# IF THE USER ARE USING ANOTHER ARCHITECTURE
	# COMPATIBLE WITH THE DEFAULT TERRARIA SERVER
	# STARTUP, WILL START IT DIRECTLY.
	#
    *)
		echo "[INFO] You are not using aarch64."
		echo "[INFO] Starting the server normally.."
		./TerrariaServer.bin.x86_64 ${PARAMETERS} ${PORT} -config ${CONFIG}
	;;
esac