#!/bin/bash

###############EXEMPLO:#############
#Viva o Linux
#echo -e '\033[01;37mViva o \033[04;32mLinux\033[00;37m!!!'
#############################################
##CORES DE FONTES EM BOLD,###################
##INSERIR A COR NO INÍCIO E FINALIZA COM FIM
##EXEMPLO:
## echo -e $amar"SEU_TEXTO_AQUI"$fim
#############################################
pret="\033[1;30m"
verm="\033[1;31m"
verd="\033[1;32m"
amar="\033[1;33m" 
azul="\033[1;34m"
mag="\033[1;35m"
cian="\033[1;36m"
bra="\033[1;37m"
fim="\033[0;37m"
#############################################

clear

echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $bra"BEM VINDO AO SCRIPT SOUSA TIPS"$fim
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 2
echo ""
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $bra"Este script irá:"$fim
sleep 1
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 1
echo -e $bra" ● Instalar e configurar o proxy squid nas portas"$fim 
echo -e $bra"80, 3128, 8080 e 8799 para permitir,"$fim
echo -e $bra"conexões SSH para este servidor"$fim
sleep 2
echo -e $bra" ● Configurar o OpenSSH para rodar nas portas 22 e 443"$fim
sleep 2
echo -e $bra" ● Instalar um conjunto de scripts como comandos do" 
echo -e $bra"sistema para o gerenciamento de usuários"$fim
sleep 2
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 2
echo ""
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
tput setaf 2 ; tput bold ; read -n 1 -s -p "APERTE QUALQUER TECLA PARA CONTINUAR..." ; echo "" ; echo "" ; tput sgr0
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
IP=$(wget -qO- ipv4.icanhazip.com)
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
read -p "ESTÁ CORRETO O SEU IP? " -e -i $IP ipdovps
echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
if [ -z "$ipdovps" ]
then
	echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
	echo -e $verm" PRECISA DIGITAR O IP DO SERVIDOR! "$fim
	echo -e $verd"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
	exit 1
fi
if [ -f "/root/usuarios.db" ]
then
	echo ""
	echo -e $amar"Uma base de dados de usuários ('usuarios.db') foi encontrada!"$fim
	echo -e $amar"Deseja mantê-la (preservando o limite de conexões simultâneas dos usuários)"$fim
	echo -e $amar"ou criar uma nova base de dados?"$fim
	echo ""
	echo -e $verd"[1] Manter Base de Dados Atual"$fim
	echo -e $verd"[2] Criar uma Nova Base de Dados"$fim
	echo ""
	read -p "Opção?: " -e -i 1 optiondb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
echo ""
read -p "Deseja ativar a compressão SSH (pode aumentar o consumo de RAM)? [s/n]) " -e -i n sshcompression
echo ""
echo -e $verd"Aguarde a configuração automática"$fim
echo ""
sleep 3
apt-get update -y >/dev/null 2>/dev/null
apt-get upgrade -y >/dev/null 2>/dev/null

apt-get install python-pip -y >/dev/null 2>/dev/null
pip install speedtest-cli >/dev/null 2>/dev/null
apt-get update >/dev/null 2>/dev/null
apt-get install -y python3-pip >/dev/null 2>/dev/null

rm /bin/addhost >/dev/null 2>/dev/null
rm /bin/ajuda >/dev/null 2>/dev/null
rm /bin/alterarlimite >/dev/null 2>/dev/null
rm /bin/alterarsenha >/dev/null 2>/dev/null
rm /bin/ativarstunnel >/dev/null 2>/dev/null
rm /bin/att >/dev/null 2>/dev/null
rm /bin/atualizar >/dev/null 2>/dev/null
rm /bin/badudp >/dev/null 2>/dev/null
rm /bin/clearcache >/dev/null 2>/dev/null
rm /bin/criarusuario >/dev/null 2>/dev/null
rm /bin/delhost >/dev/null 2>/dev/null
rm /bin/desativarstunnel >/dev/null 2>/dev/null
rm /bin/expcleaner >/dev/null 2>/dev/null
rm /bin/limiteconexao >/dev/null 2>/dev/null
rm /bin/menu >/dev/null 2>/dev/null
rm /bin/mudardata >/dev/null 2>/dev/null
rm /bin/remover >/dev/null 2>/dev/null
rm /bin/setup.sh >/dev/null 2>/dev/null
rm /bin/socks >/dev/null 2>/dev/null
rm /bin/socks.py >/dev/null 2>/dev/null
rm /bin/speedtest.py >/dev/null 2>/dev/null
rm /bin/sshlimiter >/dev/null 2>/dev/null
rm /bin/sshmonitor >/dev/null 2>/dev/null
rm /bin/testeconexao >/dev/null 2>/dev/null
rm /bin/uinstall-script >/dev/null 2>/dev/null
rm /bin/userbkp >/dev/null 2>/dev/null
rm /bin/ver >/dev/null 2>/dev/null
rm /bin/ver1 >/dev/null 2>/dev/null

rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh >/dev/null 2>/dev/null

apt-get install squid3 bc screen nano unzip dos2unix wget -y > /dev/null
apt-get install htop -y > /dev/null

killall apache2 1>/dev/null 2>/dev/null
apt-get purge apache2 -y 1>/dev/null 2>/dev/null
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp
fi
if [ -d "/etc/squid3/" ]
then
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/squid1.txt -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/squid2.txt -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/payload.txt -O /etc/squid3/payload.txt
	echo " " >> /etc/squid3/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/menu.sh -O /bin/menu
	chmod +x /bin/menu
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/atualizar.sh -O /bin/atualizar
	chmod +x /bin/atualizar
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/clearcache.sh -O /bin/clearcache
	chmod +x /bin/clearcache
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/badudp.sh -O /bin/badudp
	chmod +x /bin/badudp
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/userbkp.sh -O /bin/userbkp
	chmod +x /bin/userbkp
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/socks.py -O /bin/socks.py
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/socks -O /bin/socks
	chmod +x /bin/socks
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/setup.sh -O /bin/setup.sh
	chmod +x /bin/setup.sh
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/att.sh -O /bin/att
	chmod +x /bin/att
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/ver -O /bin/ver
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/ver1 -O /bin/ver1
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/testeconexao -O /bin/testeconexao
	chmod +x /bin/testeconexao
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/speedtest.py -O /bin/speedtest.py
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/uinstall-script -O /bin/uinstall-script
	chmod +x /bin/uinstall-script
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/limiteconexao -O /bin/limiteconexao
	chmod +x /bin/limiteconexao
	wget https://raw.githubusercontent.com/Leonn34/scripts/master/ativarstunnel.sh -O /bin/ativarstunnel
	chmod +x /bin/ativarstunnel
	wget https://raw.githubusercontent.com/Leonn34/scripts/master/desativarstunnel.sh -O /bin/desativarstunnel
	chmod +x /bin/desativarstunnel

	
	if [ ! -f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
if [ -d "/etc/squid/" ]
then
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/squid1.txt -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/squid.txt -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/payload.txt -O /etc/squid/payload.txt
	echo " " >> /etc/squid/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/2/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/2/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/menu.sh -O /bin/menu
	chmod +x /bin/menu
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/atualizar.sh -O /bin/atualizar
	chmod +x /bin/atualizar
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/clearcache.sh -O /bin/clearcache
	chmod +x /bin/clearcache
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/badudp.sh -O /bin/badudp
	chmod +x /bin/badudp
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/userbkp.sh -O /bin/userbkp
	chmod +x /bin/userbkp
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/socks.py -O /bin/socks.py
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/socks -O /bin/socks
	chmod +x /bin/socks
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/setup.sh -O /bin/setup.sh
	chmod +x /bin/setup.sh
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/att.sh -O /bin/att
	chmod +x /bin/att
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/ver -O /bin/ver
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/ver1 -O /bin/ver1
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/testeconexao -O /bin/testeconexao
	chmod +x /bin/testeconexao
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/speedtest.py -O /bin/speedtest.py
	chmod +x /bin/speedtest.py
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/uinstall-script -O /bin/uinstall-script
	chmod +x /bin/uinstall-script
	wget https://raw.githubusercontent.com/Leonn34/script-2/master/scripts/limiteconexao -O /bin/limiteconexao
	chmod +x /bin/limiteconexao
	wget https://raw.githubusercontent.com/Leonn34/scripts/master/ativarstunnel.sh -O /bin/ativarstunnel
	chmod +x /bin/ativarstunnel
	wget https://raw.githubusercontent.com/Leonn34/scripts/master/desativarstunnel.sh -O /bin/desativarstunnel
	chmod +x /bin/desativarstunnel

	if [ ! -f "/etc/init.d/squid" ]
	then
		service squid reload > /dev/null
	else
		/etc/init.d/squid reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
rm /bin/setup.sh
clear
echo ""
echo -e $verd"Proxy Squid Instalado e rodando nas portas: 80, 3128, 8080 e 8799"$fim
echo -e $verd"OpenSSH rodando nas portas 22 e 443"$fim
echo -e $verd"Para ver os comandos disponíveis use o comando: menu"$fim
echo ""
sleep 7
echo -e $bra"ENTRANDO NO MENU EM..."$fim
sleep 1
echo ""
echo -e $verd"5"$fim
sleep 1
echo -e $verd"4"$fim
sleep 1
echo -e $verd"3"$fim
sleep 1
echo -e $verd"2"$fim
sleep 1
echo -e $verd"1"$fim
clear
menu

if [[ "$optiondb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$sshcompression" = 's' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
	echo "Compression yes" >> /etc/ssh/sshd_config
fi
if [[ "$sshcompression" = 'n' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
fi
exit 1
