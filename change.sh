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
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
BLUE='\e[0;34m'
clear
echo -e ""
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                   \e[30m\e[$box ◎ CHANGE PORT MENU ◎\e[30m\e[1m                      \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e ""
echo -e "  \e[$number [ 1 ]\e[m \e[$below Change Port Stunnel\e[m"
echo -e "  \e[$number [ 2 ]\e[m \e[$below Change Port OpenVPN\e[m"
echo -e "  \e[$number [ 3 ]\e[m \e[$below Change Port OHP SSH\e[m"
echo -e "  \e[$number [ 4 ]\e[m \e[$below Change Port Websocket SSH\e[m"
echo -e "  \e[$number [ 5 ]\e[m \e[$below Change Port Wireguard\e[m"
echo -e "  \e[$number [ 6 ]\e[m \e[$below Change Port Xray Core\e[m"
echo -e "  \e[$number [ 7 ]\e[m \e[$below Change Port Trojan Go\e[m"
echo -e "  \e[$number [ 8 ]\e[m \e[$below Change Port Squid Proxy\e[m"
echo -e ""
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                  \e[30m\e[$box ◎ Moded By XoolVPN ◎\e[30m\e[1m                     \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   ""
read -p   "   SELECT OPTION FROM [1-8 or x to exit menu] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-ohp
;;
4)
port-websocket
;;
5)
port-wg
;;
6)
port-xray
;;
7)
port-trojan
;;
8)
port-squid
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
