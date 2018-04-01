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
# MENU1 (GERENCIAR USUARIOS)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo ""
echo -e $branco"GERENCIADOR DE USUARIOS"$fim
echo ""
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $amarelo"[1]"$fim $branco"CRIAR USUÁRIOS SSH"$fim
sleep 0.2
echo -e $amarelo"[2]"$fim $branco"CRIAR BACKUP USUÁRIO SSH"$fim
sleep 0.2
echo -e $amarelo"[3]"$fim $branco"ALTERAR DATA DO USUÁRIO"$fim
sleep 0.2
echo -e $amarelo"[4]"$fim $branco"ALTERAR LIMITE DE CONEXÕES"$fim
sleep 0.2
echo -e $amarelo"[5]"$fim $branco"MUDAR SENHA"$fim
sleep 0.2
echo -e $amarelo"[6]"$fim $branco"REMOVER USUÁRIOS VENCIDOS"$fim
sleep 0.2
echo -e $amarelo"[7]"$fim $branco"REMOVER USUÁRIO"$fim
sleep 0.2
echo -e $amarelo"[8]"$fim $branco"VOLTAR AO MENU PRINCIPAL"$fim
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
sleep 0.2
echo ""

read -p " DIGITE SUA OPÇÃO: [1-8] " opcao
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
echo -e $cinzaClaro" OPÇÃO ESCOLHIDA:"$fim $branco$opcao$fim

case $opcao in

1)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
criarusuario
;;
2)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
userbkp
;;
3)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
mudardata
;;
4)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
alterarlimite
;;
5)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
alterarsenha
;;
6)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
expcleaner
;;
7)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
remover
;;
8)
echo -e $verdeClaro"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="$fim
menu
;;
*)
echo -e $vermelhoClaro"OPÇÃO INVÁLIDA!!!"$fim
sleep 4
menu1
esac
