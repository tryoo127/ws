#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
#Input Domain
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn4="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
clear
cek=$(netstat -nutlp | grep -w 80)
if [[ -z $cek ]]; then
echo ""
echo -e "${BLUE}=====================================================${NC}"
echo -e "                  CHANGE DOMAIN"
echo -e "${BLUE}=====================================================${NC}"
echo ""
echo "Please Input Domain Or Subdomain"
read -p "Hostname / Domain: " host
echo "IP=" >> /var/lib/premium-script/ipvps.conf
echo $host > /root/domain
sleep 2
clear
else
sleep 1
#rm -f /home/domain
echo "$host" > /usr/local/etc/xray/domain
domain=$(cat /usr/local/etc/xray/domain)
echo ""
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo ""
#Done
echo -e "[${GREEN}CHANGE DOMAIN SUCCESSFUL${NC}]"
else
echo -e "\e[1;32mPort 80 is used\e[0m"
echo -e "\e[1;31mBefore changing domains, make sure port 80 is not used, if you are not sure whether port 80 is in use, please type info to see the active port.\e[0m"
sleep 2
fi
