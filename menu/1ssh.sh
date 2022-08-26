
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

echo -e ""
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                   \e[30m\e[$box ◎ SSH OVPN MENU ◎\e[30m\e[1m                      \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "    \e[$number [ 1 ]\e[m \e[$below CREATE SSH & OPENVPN ACCOUNT\e[m"
echo -e "    \e[$number [ 2 ]\e[m \e[$below RENEW SSH & OPENVPN ACCOUNT\e[m"
echo -e "    \e[$number [ 3 ]\e[m \e[$below DELETE SSH & OPENVPN ACCOUNT\e[m"
echo -e "    \e[$number [ 4 ]\e[m \e[$below CHECK USER LOGIN SSH & OPENVPN\e[m"
echo -e "    \e[$number [ 5 ]\e[m \e[$below LIST MEMBER SSH & OPENVPN\e[m"
echo -e "    \e[$number [ 6 ]\e[m \e[$below DELETE USER EXPIRED SSH & OPENVPN\e[m"
echo -e "    \e[$number [ 7 ]\e[m \e[$below SET UP AUTOKILL SSH\e[m"
echo -e "    \e[$number [ 8 ]\e[m \e[$below CEK USERS WHO DO MULTI LOGIN SSH\e[m"
echo -e "    \e[$number [ 9 ]\e[m \e[$below RESTART SERVICE DROPBEAR, SQUID3,\e[m"
echo -e ""
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                  \e[30m\e[$box ◎ Moded By XoolVPN ◎\e[30m\e[1m                     \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -p   "   SELECT OPTION FROM [1-0 or x to exit menu] :  " ssh
echo -e ""
case $ssh in
1)
add-ssh
;;
2)
renew-ssh
;;
3)
del-ssh
;;
4)
cek-ssh
;;
5)
member
;;
6)
delete
;;
7)
autokill
;;
8)
ceklim
;;
9)
restart
;;
x)
menu
;;
*)
echo "PLEASE ENTER AN CORRECT NUMBER"
;;
esac
