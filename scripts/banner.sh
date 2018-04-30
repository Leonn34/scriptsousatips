#!/bin/bash
# cria um bkp do sshd_config
clear
sshd_config_bak=$(cat /etc/ssh/sshd_config | grep -v "Banner")
echo "$sshd_config_bak" > /etc/ssh/sshd_config
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
service ssh restart 1>/dev/null 2>/dev/null
service sshd restart 1>/dev/null 2>/dev/null

# banner personalizado
FILE="/etc/bannerssh"

txt_font () {
echo ""
echo -ne " DIGITE O TEXTO PARA O BANNER:"; read ban_ner2
echo ""
echo -e " Escolha a cor para:" $ban_ner2
echo -e "-------------"
echo -e " 1 VERDE"
echo -e " 2 VERMELHO"
echo -e " 3 AZUL"
echo -e " 4 AMARELO"
echo -e " 5 ROXO"
echo -e "-------------"
echo -ne "OPÇÃO [1-5]:"; read ban_ner2_cor

if [ "$ban_ner2_cor" = "1" ]; then
echo '<h6><font color="green">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "2" ]; then
echo '<h6><font color="red">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "3" ]; then
echo '<h6><font color="blue">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "4" ]; then
echo '<h6><font color="yellow">' >> $FILE
a__a="1"
fi
if [ "$ban_ner2_cor" = "5" ]; then
echo '<h6><font color="purple">' >> $FILE
a__a="1"
fi
if [ "$a__a" = "" ]; then
echo '<h6><font color="red">' >> $FILE
fi
unset a__a
echo "$ban_ner2" >> $FILE
echo "</h6></font>" >> $FILE
}

clear

echo -e " MENSAGEN ATUAL:"
echo ""
NUMBER=$(cat $FILE | wc -l)
if [ -z "$NUMBER" ]; then
  echo -e " Você não possui nenhuma mensagem no momento!"
else
  echo -ne ""; cat $FILE
fi
echo ""
echo -ne " DIGITE A MENSAGEM PRINCIPAL:"; read BANNER
echo ""
if [ -z "$BANNER" ]; then
  echo "Voce não digitou nada!"
  sleep 5
  banner
else
echo -e " Escolha a cor para: "$BANNER
echo -e "-------------"
echo -e " 1  VERDE"
echo -e " 2  VERMELHO"
echo -e " 3  AZUL"
echo -e " 4  AMARELO"
echo -e " 5  ROXO"
echo -e "-------------"
echo -ne " OPÇÃO [1-5]:"; read ban_ner_cor
echo '<h1><font>=============================</font></h1>' > $FILE

if [ "$ban_ner_cor" = "1" ]; then
echo '<h1><font color="green">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "2" ]; then
echo '<h1><font color="red">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "3" ]; then
echo '<h1><font color="blue">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "4" ]; then
echo '<h1><font color="yellow">' >> $FILE
a__a="1"
fi
if [ "$ban_ner_cor" = "5" ]; then
echo '<h1><font color="purple">' >> $FILE
a__a="1"
fi
if [ "$a__a" = "" ]; then
echo '<h1><font color="blue">' >> $FILE
fi
unset a__a
echo "$BANNER" >> $FILE
echo '</font> </h3>' >> $FILE
echo '<h1><font>=============================</font></h1>' >> $FILE
while true; do
echo ""
echo -ne ""
echo -e " Deseja adicionar mais textos?"
read -p " [ s | n ]: " sin_nao
if [[ "$sin_nao" = "s" || "$sin_nao" = "S" ]]; then
txt_font
fi
if [[ "$sin_nao" = "n" || "$sin_nao" = "N" ]]; then
break
fi
done
echo '<h1><font>=============================</font></h1>' >> $FILE
echo '</h8><font color="purple">SOUSA TIPS ®</font></h8>' >> $FILE
echo '<h1><font>=============================</font></h1>' >> $FILE
if [ -e "$local2" ]; then
rm $local2  > /dev/null 2>&1
cp $local $local2 > /dev/null 2>&1
fi
echo -e "${cor[1]} =================================== ${cor[0]}"
  service ssh reload 1> /dev/null 2> /dev/null
  clear
  echo -e " Mensagem atual:"; echo ""
  NUMBER=$(cat $FILE | wc -l)
  if [ -z "$NUMBER" ]; then
    echo -e " Você não possui nenhuma mensagem no momento!"
  else
    echo -ne ""; cat $FILE
  fi
  echo ""
  echo -e " Mensagem alterada com sucesso!"
fi
echo ""
echo -ne " APERTE ENTER PARA VOLTAR AO MENU... "
read ENTER
menu
exit
