#!/bin/bash

#Instalando dependências
apt install wget -y > /dev/null 2>&1
mkdir -p /home/seethesite/sites > /dev/null 2>&1

## INICIANDO O PROGRAMA 

#Remover um site do arquivo de sites baixados

if [ $1 == "-R" ];then
	
	#Listando arquivos para remoção

	echo -e "Removendo um site do arquivo de sites baixados"
	for i in $(ls /home/seethesite/sites);do
		cont=$(( ${cont} + 1))
			if (( ${cont} < 10 ));then
				echo "[0${cont}] - ${i}"
			else
				echo "[${cont}] - ${i}"
			fi
	done  

	#Escolher site para ser removido

	echo -e "\nEscolha do site que deseja remover"
	read -p "Digite o índice do site (1-${cont}): " indice
	echo -e "\n"

	#Removendo o site escolhido

	cont=0
	for i in $(ls /home/seethesite/sites);do
		cont=$(( ${cont} + 1 ))
		if (( ${cont} == ${indice} ));then
			rm -rf /home/seethesite/sites/${i}
		fi
	done
	
	
	cont=0
	for i in $(ls /home/seethesite/sites);do
		cont=$(( ${cont} + 1))
			if (( ${cont} < 10 ));then
				echo "[0${cont}] - ${i}"
			else
				echo "[${cont}] - ${i}"
			fi
	done  

# Manual

elif [ $1 == "man" ];then
	
	#Abrindo manual do comando seethesite
	
	echo -e "\n		WELCOME TO THE MANUAL OF THE SEETHESITE"
	echo -e "\n	=====================================================\n"
	echo -e "		Exemple:./seethesite.sh [parameter 1] \n"
	echo -e "		POSSIBLES PARAMETERS"
	echo -e "		man - to see the manual"
	echo -e "		-R  - to choose a site to remove of the file of downloaded sites"
	echo -e "\n	=====================================================\n"

# Comando sem parametros 

elif [ -z $1 ];then
	
	#Aviso de parametros vazios
	echo -e "ERROR: No parameters"

# Baixando um site novo 

elif [ $1 == "-d" ];then

	#Baixando o site indicado
	
	echo -e "Fazendo download do site < $2 > ..."
	wget -P /home/seethesite/sites/ $2 > /dev/null

	#Mostrando o site que foi baixado

	cont=0
	for i in $(ls -t /home/seethesite/sites);do
		cont=$(( ${cont} + 1 ))
		if (( ${cont} == 1 ));then	
			#Formatando e mostrando o site
			sed 's/<[^>]*>//g' /home/seethesite/sites/${i} | sed 's/<![^*]//g' | sed '/if/d' | sed '/else/d' |sed '/-->/d' | sed '/}/d' | sed '/{/d' | sed '/-/d' | sed '/^$/d' | sed '/var/d' | sed '/]]/d' | sed '/parent/d' | sed '/href/d' | sed '/.log/d' | sed '/.setItem/d' | less
		else
			exit
		fi
	done

# Listar sites já baixados
	
elif [ $1 == "-D" ];then

	#Mostrando lista de sites baixados
	
	echo -e "\n==========================================================================\n"
	echo -e "Lista de sites baixados:"
	
	cont=0
	for i in $(ls -t /home/seethesite/sites);do
		cont=$(( ${cont} + 1))
		if (( ${cont} < 10 ));then
			echo "[0${cont}] - ${i}"
		else
			echo "[${cont}] - ${i}"
		fi
	done  

	#Escolher site para ser exibido
	
	echo -e "\nEscolha do site que deseja acessar"
	read -p "Digite o índice do site (1-${cont}): " indice
	echo -e "\n"

	#Mostrando o site escolhido
	
	cont=0
	for i in $(ls -t /home/seethesite/sites);do
		cont=$(( ${cont} + 1 ))
		if (( ${cont} == ${indice} ));then
			#Formatando e mostrando o site
			sed 's/<[^>]*>//g' /home/seethesite/sites/${i} | sed 's/<![^*]//g' | sed '/if/d' | sed '/else/d' |sed '/-->/d' | sed '/}/d' | sed '/{/d' | sed '/-/d' | sed '/^$/d' | sed '/var/d' | sed '/]]/d' | sed '/parent/d' | sed '/href/d' | sed '/.log/d' | sed '/.setItem/d' | less
		fi
	done

	echo -e "\n==========================================================================\n"

# Desinstalar o programa

elif [ $1 == '--remove' ];then
	
	echo -e "\n Desinstaladno o programa"
	rm -rf /home/seethesite && echo "Desinstalacao completa" || echo "Desinstalacao incompleta, tente remover manualmente o caminho /home/seethesite para concluir" 
fi

#Formatar o site escolhido
#Criar manual do arquivo
