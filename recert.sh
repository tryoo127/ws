RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m     • RECERT / RENEW DOMAIN •       \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" 
echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
rm /etc/xray/domain
echo "$host" > /usr/local/etc/xray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo -e "" 
#Update Sertificate SSL
echo -e "\e[0;32mRENEW CERTIFICATE & DOMAIN IN PROGRESS\e[0m"
sleep 3
echo Starting Update SSL Sertificate
sleep 1
source /var/lib/premium-script/ipvps.conf
domain=$IP
clear
systemctl stop xray
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/rare/xray/xray.crt --keypath /etc/rare/xray/xray.key --ecc
systemctl start xray
echo Done
sleep 0.5
echo -e "[${GREEN}DONE${NC}]"
else
echo -e "\e[1;32mPort 80 is used\e[0m"
echo -e "\e[1;31mBefore renew domains, make sure port 80 is not used, if you are not sure whether port 80 is in use, please type info to see the active port.\e[0m"
sleep 1
fi
