#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="tryoo127"
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "\e[0;32m            PERMISSION ACCEPTED!\e[0m"
else
clear
echo ""
rm -f setup.sh
echo -e "\e[1;31m              PERMISSION DENIED!\e[0m"
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P\e[0m"
sleep 5
exit 0
fi
clear
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo -e ""
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                   \e[30m\e[$box ◎ SYSTEM MENU ◎\e[30m\e[1m                     \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e ""
echo -e "   \e[$number [ 1 ]\e[m \e[$below ADD NEW SUBDOMAIN\e[m"
echo -e "   \e[$number [ 2 ]\e[m \e[$below RENEW CERT DOMAIN\e[m"
echo -e "   \e[$number [ 3 ]\e[m \e[$below BACKUP DATA VPS\e[m"
echo -e "   \e[$number [ 4 ]\e[m \e[$below RESTORE DATA VPS\e[m"
echo -e "   \e[$number [ 5 ]\e[m \e[$below SET SPEED VPS\e[m"
echo -e "   \e[$number [ 6 ]\e[m \e[$below RESTART SERVICE VPN\e[m"
echo -e "   \e[$number [ 7 ]\e[m \e[$below SPEEDTEST VPS\e[m"
echo -e "   \e[$number [ 8 ]\e[m \e[$below INFO ALL PORT\e[m"
echo -e "   \e[$number [ 9 ]\e[m \e[$below INSTALL BBR\e[m"
echo -e "   \e[$number [ 0 ]\e[m \e[$below ON/OF AUTO REBOOT\e[m"
echo -e ""
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                  \e[30m\e[$box ◎ Moded By XoolVPN ◎\e[30m\e[1m                     \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -p   "   SELECT OPTION FROM [1-0 or x to exit menu] :  " sys
echo -e ""
case $sys in
1)
add-host
;;
2)
certv2ray
;;
3)
backup
;;
4)
restore
;;
5)
limit-speed
;;
6)
restart
;;
7)
speedtest
;;
8)
info
;;
9)
bbr
;;
0)
autoreboot
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
