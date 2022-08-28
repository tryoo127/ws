#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
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
MYIP=$(wget -qO- ipinfo.io/ip);
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$(cat /usr/local/etc/xray/domain)
clear
echo -e "============================================="
echo -e "       RENEW DOMAIN CLOUDFLARE & RECERT"
echo -e "============================================="
sleep 2
echo " PLEASE INPUT YOUR POINTING DOMAIN ON CLOUDFLARE"
read -rp " DOMAIN/HOST (CLOUDFLARE I.P) : " -e host
rm /usr/local/etc/xray/domain
echo "$host" > /usr/local/etc/xray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo -e "" 
#Update Sertificate SSL
echo "Automatical Update Your Sertificate SSL"
sleep 3
echo Starting Update SSL Sertificate
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop nginx
systemctl stop xray
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc
systemctl daemon-reload
systemctl restart nginx
systemctl daemon-reload
systemctl restart xray
systemctl restart xray.service
echo ""
echo -e "============================================="
echo -e "      RENEW DOMAIN & RECERT SUCCESSFUL!"
echo -e "============================================="
sleep 2
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
clear
