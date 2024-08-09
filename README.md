# issabel-construtor
FINALIDADE
  Este script tem como finalidade auxiliar na configuração de um issabel do zero.

FUNÇÕES
  iptables.sh - Este arquivo contem as regras de iptables utilizadas para segurança do servidor, e possui como dependente os seguintes arquivos: 
    ips-liberados.sh - Arquivo contendo todos ips brasileiros, onde permite o registro de ramais na porta 5060.
    life.sh.gpg - Arquivo criptografado, contendo configurações unicaas utilizados na empresa "Life".

COMO UTILIZAR

  iptables.sh
    Este arquivo é baixado automaticamente pelo construtor, porem, caso queira apenas renovar em um servidor que já possui, siga 0 passo a passo: 
    $ sudo rm -rf /var/script/iptables.sh
    $ sudo wget -c https://raw.githubusercontent.com/cgrsup/issabel-construtor/main/iptables.sh?token=GHSAT0AAAAAACV5LIWIFHP3BWWWLSRO4D4SZVWOGDA
    $ sudo chmod +x iptables.sh
    $ sudo ./iptables.sh
