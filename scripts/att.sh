#!/bin/bash

#############################################
corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"
fim="\033[0;37m"
#############################################

arq="/bin/ver"
arq1="/bin/ver1"

mv -f $arq1 $arq

#############################################
clear
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Aguarde...."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear
echo ""

#ATUALIZANDO SISTEMA

apt-get update >/dev/null 2>/dev/null
apt-get upgrade -y >/dev/null 2>/dev/null

apt-get install bc >/dev/null 2>/dev/null
apt-get install python-pip -y >/dev/null 2>/dev/null
pip install speedtest-cli >/dev/null 2>/dev/null
apt-get update >/dev/null 2>/dev/null
apt-get install -y python3-pip >/dev/null 2>/dev/null

#cd /bin

#REMOVENDO ARQUIVOS
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Removendo Arquivos..."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear

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

rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh >/dev/null 2>/dev/null

echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Arquivos Removidos!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear

#BAIXANDO SCRIPTS
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"Baixando novos arquivos..."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
clear


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

rm /bin/setup.sh >/dev/null 2>/dev/null
clear

echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $verdeClaro"Download concluido!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
cd
sleep 2
clear

#REINICIANDO SQUID E SSH
	
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

clear
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $verdeClaro"Atualizado com sucesso!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 5
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo"Entrando no menu em:..."$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 1
echo ""
echo -e $verdeClaro"5....."$fim
sleep 1
echo -e $verdeClaro"4...."$fim
sleep 1
echo -e $verdeClaro"3..."$fim
sleep 1
echo -e $verdeClaro"2.."$fim
sleep 1
echo -e $verdeClaro"1."$fim
sleep 1
clear
exit1
menu
