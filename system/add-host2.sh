#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/xoolvpn/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Tahniah! Anda Dibenarkan menggunakan SAMVPN...${NC}"
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo '        Anda Tidak Dibenarkan Menggunakan Script ini!     '
echo '                            ...                           '
echo '        SILA REGISTER IP ANDA DI BOT @ctechdidik_bot!     '
echo '                        t.me/XoolVPN                      '
sleep 20
exit 0
fi
clear

echo "Tukar Domain?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) make install; break;;
        No ) exit;;
    esac
done
clear

echo -e "Masukkan Domain"
read -p "Hostname / Domain: " host
rm -f /var/lib/premium-script/ipvps.conf
rm -f /etc/xray/domain
clear
mkdir /etc/xray
mkdir /var/lib/premium-script;
clear
echo -e "Masukkan Domain Sekali Lagi"
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/xray/domain
