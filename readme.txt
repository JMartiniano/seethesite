		ESTE ARQUIVO É A EXPLICAÇÃO DESTE PROJETO

Para resolver o projeto foi criado um programa em shell script denominado seethesite.sh, este programa foi codificado para funcionar de maneira semelhante à um comando bash comum, logo, ele será executado chamando o arquivo de comando e adicionando parâmetros. Abaixo, irei explicar os parâmetros possíveis:

	-d <link do site> --> faz o download de sites novos para serem exibidos no terminal. (Esse comando baixa e exibe o site indicado.
	-D --> lista os sites baixados e permite a leitura deles
	-R --> remove um site do arquivo de sites baixados
	man --> exibe o manual do comando
	--remove --> desinstala completamente o comando e apaga todos os arquivos relacionados à ele

Todos os sites baixados são salvos no caminho padrão (/home/seethesite/sites).

O projeto tem como capacidade:

	- Menu de intereção à partir de parâmetros
	- Salva os sites baixados
	- Pode manipular os sites baixados
	- Manual

PARA EXECUTAR: baixe o arquivo projetoPronto.zip, descompacte, entre no diretório projetoPronto, execute o install.sh, dê o comando ./seethesite.sh -D
