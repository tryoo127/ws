#!/bin/bash
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /usr/local/etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-99 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
clear
# CLIENT DETAILS
NAME=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $2}')
EXP=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $3}')
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text               \e[30m\e[$box ◎ SERVER INFORMATION & STATUS ◎\e[30m\e[1m             \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$text Script Version          : AIO V1.1"
echo -e "  \e[$text Client Name             : $NAME"
echo -e "  \e[$text Expired Status          : $EXP"
echo -e "  \e[$text Isp/Provider Name       : $ISP"
echo -e "  \e[$text Server Location         : $WKT"
echo -e "  \e[$text Ip Vps/Address          : $IPVPS"
echo -e "  \e[$text Domain Name             : $domain\e[0m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Open SSH                : "$green"Service Is Running"$NC" ✓"
else
echo -e "   Open SSH              
 : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show --now openvpn-server@server-tcp-1194 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   OpenVPN TCP             : "$green"Service Is Running"$NC" ✓"
else
echo -e "  OpenVPN TCP           : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show --now openvpn-server@server-udp-2200 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   OpenVPN UDP             : "$green"Service Is Running"$NC" ✓"
else
echo -e "   OpenVPN UDP            : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Stunnel(SSL)            : "$green"Service Is Running"$NC" ✓"
else
echo -e "  Stunnel(SSL)           : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ohps.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   OHP-SSH                 : "$green"Service Is Running"$NC" ✓"
else
echo -e "   OHP-SSH                 
: "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ohpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   OHP-Dropbear            : "$green"Service Is Running"$NC" ✓"
else
echo -e "   OHP-Dropbear           : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   OHP-OpenVPN             : "$green"Service Is Running"$NC" ✓"
else
echo -e "   OHP-OpenVPN            : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   DropBear                : "$green"Service Is Running"$NC" ✓"
else
echo -e "   DropBear               : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Squid Proxy             : "$green"Service Is Running"$NC" ✓"
else
echo -e " Squid Proxy               : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Nginx Status            : "$green"Service Is Running"$NC" ✓"
else
echo -e " Nginx Status            : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show cdn-dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Websocket SSH(HTTP)     : "$green"Service Is Running"$NC" ✓"
else
echo -e "   Websocket SSH(HTTP)    : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show cdn-ssl.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Websocket SSL(HTTPS)    : "$green"Service Is Running"$NC" ✓"
else
echo -e "   Websocket SSL(HTTPS)   : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show cdn-ovpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Websocket OpenVPN       : "$green"Service Is Running"$NC" ✓"
else
echo -e "   Websocket OpenVPN      : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show wg-quick@wg0 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Wireguard               : "$green"Service Is Running"$NC" ✓"
else
echo -e " Wireguard               : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ssrmu --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   ShadowsockR             : "$green"Service Is Running"$NC" ✓"
else
echo -e "   ShadowsockR            : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show shadowsocks-libev.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Shadowsocks             : "$green"Service Is Running"$NC" ✓"
else
echo -e " Shadowsocks              : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Xray Vmess Ws Tls       : "$green"Service Is Running"$NC" ✓"
else
echo -e " Xray Vmess Ws Tls       : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Xray Vmess Ws None Tls  : "$green"Service Is Running"$NC" ✓"
else
echo -e " Xray Vmess Ws None Tls  : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Xray Vless Ws Tls       : "$green"Service Is Running"$NC" ✓"
else
echo -e " Xray Vless Ws Tls       : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Xray Vless Ws None Tls  : "$green"Service Is Running"$NC" ✓"
else
echo -e " Xray Vless Ws None Tls  : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Xray Trojan Tcp         : "$green"Service Is Running"$NC" ✓"
else
echo -e " Xray Trojan Tcp         : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e "   Xray Vless Tcp Xtls     : "$green"Service Is Running"$NC" ✓"
else
echo -e " Xray Vless Tcp Xtls     : "$red"not running (Error)"$NC" "
fi
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                   \e[30m\e[$box ◎ VPN PANEL MENU ◎\e[30m\e[1m                      \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e
echo -e   "  \e[$number [ 1 ]\e[m \e[$below SSH & OPENVPN\e[m    \e[$number   [ 6 ]\e[m \e[$below CHANGE PORT\e[m"
echo -e   "  \e[$number [ 2 ]\e[m \e[$below WIREGUARD\e[m          \e[$number [ 7 ]\e[m \e[$below CHECK BANDWIDTH\e[m"
echo -e   "  \e[$number [ 3 ]\e[m \e[$below SHADOWSOCKS\e[m        \e[$number [ 8 ]\e[m \e[$below CHECK DNS NETFLIX\e[m"
echo -e   "  \e[$number [ 4 ]\e[m \e[$below XRAY XTLS & TROJAN\e[m \e[$number [ 9 ]\e[m \e[$below SYSTEM MENU\e[m"
echo -e   "  \e[$number [ 5 ]\e[m \e[$below XRAY VLESS & VMESS\e[m \e[$number [ 0 ]\e[m \e[$below REBOOT SERVER\e[m"
echo -e
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   " \e[$back_text                  \e[30m\e[$box ◎ Moded By XoolVPN ◎\e[30m\e[1m                     \e[m"
echo -e   " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e   ""
read -p   "   SELECT OPTION FROM [1-0 or x to exit menu] :  " menu
echo -e   ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
ssssr
;;
4)
trojaan
;;
5)
xraay
;;
6)
change-port
;;
7)
vnstat -d
;;
8)
nf
;;
9)
system
;;
0)
reboot
;;
x)
clear
exit
echo  -e "\e[1;31mPlease Type menu For More Option, Thank You\e[0m"
;;
*)
clear
echo  -e "\e[1;31mPlease enter an correct number\e[0m"
sleep 1
menu
;;
esac
