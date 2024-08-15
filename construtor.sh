#!/bin/bash
#
#Script completo referente as todas configurações e pluggins necessários que utilizamos em nosso servidor ISSABEL.
#twitter @filhodeforas 

### CREDITOS E ANIMAÇÃO

clear

echo ""
echo "+------------------------------------------------------------+"
echo "|                   L I F E   T E L E C O M                  |"
echo "|------------------------------------------------------------|"
echo "|       Site:    www.life.com.br                             |"
echo "|      Setor:    CGR - Suporte                               |"
echo "|     Script:    Issabel Construtor                          |"
echo "+------------------------------------------------------------+"
echo ""

### SOLICITANDO INFORMACOES

while true; do
echo ""
echo "### INICIANDO O SCRIPT INSTALAÇÃO ISSABEL- CONSTRUTOR ###"
echo ""
echo "Responda as questões abaixo corretamente para que possamos realizar todas as configurações para você."
echo ""
read -p "# Digite o usuário do Banco de Dados: " int1
echo ""
read -p "# Digite a senha do Bando de Dados: " int2
echo ""
read -p "# Digite a senha do usuário admin da interface web: " int3
echo ""
read -p "# Digite a porta ssh que irá utilizar em seu servidor: " int6 #trocarporta
echo ""

clear

echo "+------------------------------------------------------------+"
echo "|                  I M P O R T A N T E !!!                   |"
echo "|------------------------------------------------------------|"
echo "|            Para dar continuidade no processo de            |"
echo "|        configuração, valide se todas as informações        |"
echo "|                  a baixo estão corretas.                   |"
echo "|                                                            |"
echo "|            Todas as informações solicitadas são            |"
echo "|        de extrema importancia para o funcionamento         |"
echo "|                         do script.                         |"
echo "+------------------------------------------------------------+"
echo " "
echo "            - Usuário do banco de dados...= $int1 "
echo "            - Senha Banco de Dados........= $int2 "
echo " "
echo "            - Senha usuário web...........= $int3 "
echo " "
echo "            - Porta SSH utilizada.........= $int6 "
echo " "
echo " "
read -p "Caso as informações estam corretas, digite 'sim', caso deseja corrigir, digite 'nao': " int66

	if [[ $int66 == "nao" ]]; then
		echo "Reiniciando o script!"

	elif [[ $int66 == "sim" ]]; then
		echo "Continuando o script!"
		break
	else
		echo "Resposta inválida. Por favor, digite 'sim' ou 'nao'."
	fi
done

### PREPARANDO O LINUX

# Incio preparação Linux

yum install wget vim htop -y
updatedb
yum -y update && yum -y upgrade

# Fim preparação Linux

### TEMA EMPRESA

# Inicio instalação tema Life

wget -c https://github.com/cgrsup/issabel-construtor/raw/main/tema-life.tgz
tar zvxf tema-life.tgz
rm -f tema-life.tgz
mv /home/script/mainstyle.css /var/www/html/modules/pbxadmin/themes/default/css/ -f
mv /home/script/CloudPabx2/ /var/www/html/themes/

# Fim instalação tema Life

### PREPARANDO SNGREP

# Incio preparando sngrep

echo ""
echo "Instalando sngrep!"
echo "" 
rm -Rf /etc/yum.repos.d/irontec.repo
echo '[copr:copr.fedorainfracloud.org:irontec:sngrep]
name=Copr repo for sngrep owned by irontec
baseurl=https://download.copr.fedorainfracloud.org/results/irontec/sngrep/epel-7-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://download.copr.fedorainfracloud.org/results/irontec/sngrep/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
' > /etc/yum.repos.d/irontec.repo
rpm --import https://download.copr.fedorainfracloud.org/results/irontec/sngrep/pubkey.gpg
yum install sngrep -y

clear

### IPTABLES

# Inicio preparando iptables.sh

wget -c https://raw.githubusercontent.com/cgrsup/issabel-construtor/main/iptables.sh?token=GHSAT0AAAAAACV5LIWIHEYDZDM5KNOIVMS6ZV6IRYQ
chmod +x iptables.sh
chown -R root:root iptables.sh

# Fim preparando iptables.sh

### RESETF2B

# Inicio preparapando resetf2b.sh

wget -c https://raw.githubusercontent.com/cgrsup/issabel-construtor/main/resetf2b.sh?token=GHSAT0AAAAAACV5LIWJTRON2SBNSX7R4GRUZV6ISLQ
chmod +x /home/script/resetf2b.sh
chown -R root:root /home/script/resetf2b.sh

# Fim preparapando resetf2b.sh

### ALTERANDO PORTA SSH DO SERVIDOR

# Inicio alterando porta SSH do arquivo ssh_config
test=`cat /etc/ssh/ssh_config | grep "$int6"`
if [[ -z $test ]]; then
 texto="Port $int6"
else
 texto=""
fi
echo $texto

if [[ -z $texto ]]; then
	echo "Porta ssh já configurada!"
else
	echo Port $int6 >> /etc/ssh/ssh_config
fi

#Alterando porta SSH do arquivo sshd_config
test=`cat /etc/ssh/sshd_config | grep "$int6"`
if [[ -z $test ]]; then
 texto="Port $int6"
else
 texto=""
fi
echo $texto

if [[ -z $texto ]]; then
	echo "Porta ssh já configurada!"
else
	echo Port $int6 >> /etc/ssh/sshd_config
fi

service sshd restart

clear

# Fim alterando porta SSH do arquivo ssh_config

### INSTALAÇÃO MONITFILAS E DOWNGRAVACOES

# Inicio preparação banco

wget -c https://github.com/cgrsup/issabel-construtor/raw/main/sql.tgz
tar zvxf sql.tgz
rm -f sql.tgz

mysqladmin -u $int1 -p$int2 create qstatslite
mysql -u $int1 -p$int2 qstatslite < qstats.sql
mysqladmin -u $int1 -p$int2 create azcall
mysql -u $int1 -p$int2 azcall < azcall.sql

mysql -u $int1 -p$int2 -e "CREATE USER 'qstatsliteuser'@'localhost' IDENTIFIED by 'somepassword'"
mysql -u $int1 -p$int2 -e "GRANT select,insert,update,delete ON qstatslite.* TO qstatsliteuser"

rm -f qstats.sql
rm -f azcall.sql

# Fim preparação banco

# Inicio baixando e configurando monitfilas e downgravacoes

wget -c https://github.com/cgrsup/issabel-construtor/raw/main/monitdown.tgz
tar zvxf monitdown.tgz
rm -f monitdown.tgz

chmod +x downgravacoes.sh
chown -R root:root build download.php monitfilas static parselog downgravacoes.sh

sed -i 's/trocaruserbanco/'$int1'/g' /home/script/monitfilas/conexao.php
sed -i 's/trocarsenhabanco/'$int2'/g' /home/script/monitfilas/conexao.php

sed -i 's/trocaruserbanco/'$int1'/g' /home/script/monitfilas/config.php
sed -i 's/trocarsenhabanco/'$int2'/g' /home/script/monitfilas/config.php
sed -i 's/trocarsenhapabx/'$int3'/g' /home/script/monitfilas/config.php

mv /home/script/build /var/www/html/
mv /home/script/monitfilas /var/www/html/
mv /home/script/static /var/www/html/
mv /home/script/download.php /var/www/html/
mv /home/script/parselog /usr/local/parseloglite

(crontab -l; echo "0 * * * * php -q /usr/local/parseloglite/parselog.php convertlocal") | crontab -
(crontab -l; echo "0 5 01 * * /home/script/downgravacoes.sh") | crontab -
(crontab -l; echo "00 6 * * * sudo /usr/sbin/asterisk -rx 'queue reset stats all'") | crontab -

# Fim baixando e configurando monitfilas e downgravacoes

clear

echo "+------------------------------------------------------------+"
echo "|                   F I N A L I Z A Ç Ã O                    |"
echo "|------------------------------------------------------------|"
echo "|                Script finalizado com sucesso!              |"
echo "|                                                            |"
echo "|          Para ativar as configurações de segurança         |"
echo "|      execute o comando a seguir, e siga as informações     |"
echo "|                    contidas no script!                     |"
echo "|                                                            |"
echo "|               sudo ./home/script/iptables.sh               |"
echo "+------------------------------------------------------------+"
