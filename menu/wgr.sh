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
echo -e""
echo -e "   \e[$line═══════════════════════════════════════\e[m"
echo -e "   \e[$back_text         \e[30m═[\e[$box PANEL WIREGUARD\e[30m ]═         \e[m"
echo -e "   \e[$line═══════════════════════════════════════\e[m"
echo -e "    \e[$number (1)\e[m \e[$below Create Wireguard Account\e[m"
echo -e "    \e[$number (2)\e[m \e[$below Delete Wireguard Account\e[m"
echo -e "    \e[$number (3)\e[m \e[$below Check User Login Wireguard\e[m"
echo -e "    \e[$number (4)\e[m \e[$below Renew Wireguard Account\e[m"
echo -e ""
echo -e "   \e[$line═══════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)  MENU                             \e[m"
echo -e "   \e[$line═══════════════════════════════════════\e[m"
echo -e "   \e[$line"
read -p "        Please Input Number  [1-4 or x] :  "  wgr
echo -e ""
case $wgr in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
wgr
;;
esac
