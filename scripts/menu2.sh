#!/bin/bash
####################################
#CORES:
#ESTILOS:
#00: Nenhum
#01: Negrito
#04: Sublinhado
#05: Piscante
#07: Reverso
#08: Oculto
####################################
#CORES TEXTO:
#30: preto
#31: Vermelho
#32: verde
#33: amarelo
#34: Azul
#35: Magenta (Rosa)
#36: Ciano (Azul Ciano)
#37: branco
####################################
#CORES FUNDO:
#40: pretoo
#41: Vermelho
#42: verde
#43: Amarelo
#44: Azul
#45: Magenta (Rosa)
#46: Ciano (Azul Ciano)
#47: Branco
###############EXEMPLO:#############
#Viva o Linux
#echo -e '\033[01;37mViva o \033[04;32mLinux\033[00;37m!!!'
#############################################
##CORES DE FONTES,###################
##INSERIR A COR NO INÍCIO E FINALIZA COM FIM
##EXEMPLO:
## echo -e $amarelo"SEU_TEXTO_AQUI"$fim
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

clear
#checar serviços
#=====================================================
ps -C dropbear > /dev/null
if [ $? = 0 ]; then
echo -e $verdeClaro"ATIVADO"$fim > /bin/status01
else
echo -e $vermelhoClaro"DESATIVADO"$fim > /bin/status01
fi
n1=$(cat /bin/status01)
#=====================================================
ps -C stunnel4 > /dev/null
if [ $? = 0 ]; then
echo -e $verdeClaro"ATIVADO"$fim > /bin/status02
else
echo -e $vermelhoClaro"DESATIVADO"$fim > /bin/status02
fi
n2=$(cat /bin/status02)
#=====================================================
ps -C socks5 > /dev/null
if [ $? = 0 ]; then
echo -e $verdeClaro"ATIVADO"$fim > /bin/status03
else
echo -e $vermelhoClaro"DESATIVADO"$fim > /bin/status03
fi
n3=$(cat /bin/status03)
#=====================================================
 # MENU2 OPCAO 3 (SERVIÇOS)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
echo -e $branco" GERENCIADOR DE SERVIÇOS"$fim
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo" [1]"$fim $branco"STUNNEL4"$fim $pretoCinza"STATUS: "$fim$n2
sleep 0.2
echo -e $amarelo" [2]"$fim $branco"SOCKS5"$fim $pretoCinza"STATUS: "$fim$n3
sleep 0.2
echo -e $amarelo" [3]"$fim $branco"DROPBEAR"$fim $pretoCinza"STATUS: "$fim$n1
sleep 0.2
echo -e $amarelo" [4]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
sleep 0.2
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
echo ""

read -p " DIGITE SUA OPÇÃO: [1-4] " opcao
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

1)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu-stunnel4
;;
2)
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo"Para que o SOCKS funcione corretamente,"$fim
echo -e $amarelo"Comente a porta a ser utilizada no squid.conf"$fim
echo -e $branco"Ex.: nano /etc/squid3/squid.conf"$fim
echo ""
echo -e $vermelhoClaro"#"$fim$verdeClaro"http_port 80"$fim
echo -e $verdeClaro"http_port 3128"$fim
echo -e $verdeClaro"http_port 8080"$fim
echo -e $verdeClaro"http_port 8799"$fim
echo ""
echo -e $amarelo"Depois reinicie:"$fim $branco"service squid3 restart"$fim
echo ""
echo -e $verdeClaro"Deseja continuar?"$fim
echo -e $branco"[1]"$fim $verdeClaro"SIM"$fim
echo -e $branco"[2]"$fim $vermelhoClaro"NÃO"$fim
echo ""
read -p "[1-2] " opcao
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in
1)
socks
;;
2)
menu2
;;
*)
echo "Opção inválida!"
sleep 1
clear
menu2
esac
;;
3)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
dropbear.sh
;;
4)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu
;;
*)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $vermelhoClaro"OPÇÃO INVÁLIDA!!!"$fim
sleep 4
menu2
esac
