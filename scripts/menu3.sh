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
# MENU3 OPCAO 4 (FERRAMENTAS)
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $branco" FERRAMENTAS"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo" [1]"$fim $branco"VERIFICAR PORTAS UTILIZADAS"$fim
sleep 0.2
echo -e $amarelo" [2]"$fim $branco"MOSTRAR NUMERO DE CONEXÕES"$fim
sleep 0.2
echo -e $amarelo" [3]"$fim $branco"LIMITAR CONEXÕES"$fim
sleep 0.2
echo -e $amarelo" [4]"$fim $branco"ADD HOSTS"$fim
sleep 0.2
echo -e $amarelo" [5]"$fim $branco"APAGAR HOSTS"$fim
sleep 0.2
echo -e $amarelo" [6]"$fim $branco"LIMPAR CACHÊ"$fim
sleep 0.2
echo -e $amarelo" [7]"$fim $branco"ATIVAR BADUDP"$fim
sleep 0.2
echo -e $amarelo" [8]"$fim $branco"TESTE DE VELOCIDADE"$fim
sleep 0.2
echo -e $amarelo" [9]"$fim $branco"DESINSTALAR O SCRIPT"$fim
sleep 0.2
echo -e $amarelo" [10]"$fim $branco"EDITAR O BANNER"$fim
sleep 0.2
echo -e $amarelo" [11]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
sleep 0.2
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
echo ""

read -p " DIGITE SUA OPÇÃO: [1-11] " opcao
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

1)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
netstat -ntpl
#voltar ao menu opcional
echo ""
echo "ENTER para voltar"
read -p " "
sleep 1s
menu3
;;
2)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sshmonitor
;;
3)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
limiteconexao
;;
4)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
addhost
;;
5)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
delhost
;;
6)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
clearcache
;;
7)
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo"COMANDOS PARA RODAR O BADUDP:"$fim
sleep 2
echo ""
echo -e $branco"1º - ABRA UMA SESSÃO"$fim $verdeClaro"SCREEN"$fim
sleep 2
echo -e $branco"DIGITE:"$fim $vermelhoClaro"screen"$fim$branco", EM SEGUIDA APERTE"$fim $verdeClaro"ENTER"$fim
sleep 2
echo -e $branco"2º - DIGITE"$fim $verdeClaro"badudp"$fim$branco", E APERTE"$fim $verdeClaro"ENTER"$fim
sleep 2
echo -e $branco"3º - PARA SAIR E DEIXAR A SESSÃO RODANDO,"$fim
sleep 2
echo -e $branco"ENTRE COM:"$fim $verdeClaro"Ctrl+A+D"$fim
sleep 2
echo ""
echo -e $amarelo"OBS.: A CADA VEZ QUE FOR REINICIADO A VPS,"$fim
echo -e $amarelo"REPITA OS MESMOS PASSOS!"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
echo "ENTER para voltar"
read -p ""
sleep 1
menu
;;
8)
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo"TESTANDO VELOCIDADE DO SERVIDOR..."$fim
sleep 2
clear
testeconexao
;;
9)
clear
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 2
clear
uinstall-script
;;
10)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
banner
;;
11)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu
;;
*)
echo -e $vermelhoClaro"OPÇÃO INVÁLIDA!!!"$fim
sleep 4
menu3
esac
