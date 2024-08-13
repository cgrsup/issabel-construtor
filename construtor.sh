#!/bin/bash
#
#Script completo referente as todas configurações e pluggins necessários que utilizamos em nosso servidor ISSABEL.
#twitter @filhodeforas 

### CREDITOS E ANIMAÇÃO

clear

echo "	"
echo "				⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠊⠉⠐⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⠀⢀⠏⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⢰⠁⢀⠔⠀⠒⢤⡔⠈⠉⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⣾⠀⡇⠀⠀⠂⢀⠂⠀⠂⠀⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⡇⠀⠑⠤⠀⠠⠊⠐⠤⠤⢞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⣼⠀⠀⠀⣀⣴⣶⣿⣿⣷⣦⡀⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⠀⡇⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣷⡌⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⢰⠁⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⠀⡾⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⠀⢠⠇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⠀⢀⡎⠀⠀⠛⠻⠿⠿⠿⠿⠿⣿⣿⠛⠛⠛⠉⠀⢰⢆⠀⠀⠀⠀⠀⠀⠀⠀"
echo "				⠀⢠⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠈⠻⣆⠀⠀⠀⠀⠀⠀⠀"
echo "				⢠⠇⠀⠀⠀⣠⠆⠀⠀⠀⠀⢁⣀⡠⢤⣼⣛⣲⣯⣭⣭⣭⠿⣆⠀⠀⠀⠀⠀⠀"
echo "				⡎⠀⠀⠀⡰⠃⠀⣀⡤⣖⠪⢿⣶⣿⣿⣿⣿⣿⣿⣿⠿⠟⠀⠘⡄⠀⠀⠀⠀⠀"
echo "				⣇⠀⠀⡼⣁⢴⡪⠗⠉⠀⠀⠀⠻⠟⢋⣿⣿⣿⣿⣿⡆⠀⠀⠀⢳⠀⠀⠀⠀⠀"
echo "				⠘⢤⣼⣋⠗⠁⠀⠀⠀⠀⠀⠀⠀⣤⣘⣿⣿⡿⣿⣟⣥⠖⠀⠀⢨⣿⣦⣀⠀⠀"
echo "				⠀⢸⡗⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⢿⡿⠟⠋⠁⠀⠀⠀⡼⠁⠀⠈⠑⢆"
echo "				⠀⠀⠳⣀⠀⠀⠀⠀⠀⠀⣠⣦⡀⢠⣄⣠⠤⠷⣀⡠⠶⢄⣀⣼⣀⠀⠀⣀⣀⠜"
echo "				⠀⠀⠀⠈⠉⠒⠤⠄⣀⣰⣿⣿⣷⣿⡟⠁⠀⠀⠈⠱⡄⠀⠀⠀⠉⠉⠉⠁⠀⠀"
echo "				⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠿⠤⢀⣀⣀⣀⡴⠃⠀⠀⠀⠀⠀⠀⠀⠀"⠀

### SOLICITANDO INFORMACOES

while true; do
echo ""
echo "                     ### INICIANDO O SCRIPT INSTALAÇÃO ISSABEL- CONSTRUTOR ###"
echo ""
echo "Responda as questões abaixo corretamente para que possamos realizar todas as configurações para você."
echo ""
read -p "# Digite o usuário do Banco de Dados: " int1
echo ""
read -p "# Digite a senha do Bando de Dados: " int2
echo ""
read -p "# Digite a senha do usuário root: " int3
echo ""
read -p "# Digite o domínio do PABX: " int4
echo ""
read -p "# Digite a range de IP que deseja autorizar no Fail2Ban: " int5 #trocarip
echo ""
read -p "# Digite a porta ssh que irá usar em seu servidor: " int6 #trocarporta
echo ""

clear

echo " ############################################################################################################### "
echo " #                                                                                                             # "
echo " #          Para dar continuidade no processo de configuração, valide se todas as informações a baixo          # "
echo " #                                              estão corretas.                                                # "
echo " #                                                                                                             # "
echo " #                      Todas as informações solicitadas são de extrema importancia para o                     # "
echo " #                                         funcionamento do script.                                            # "
echo " #                                                                                                             # "
echo " ############################################################################################################### "
echo " "
echo " "
echo " "
echo "            - Usuário do banco de dados...= $int1 "
echo "            - Senha Banco de Dados........= $int2 "
echo " "
echo "            - Senha usuário root..........= $int3 "
echo " "
echo "            - Domínio do PABX.............= $int4 "
echo " "
echo "            - Range de IP utilizado.......= $int5 "
echo "            - Porta SSH utilizada.........= $int6 "
echo " "
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

# yum install wget mtr vim mlocate nmap tcpdump mc nano lynx rsync minicom screen htop subversion deltarpm issabel-callcenter -y
yum install wget vim htop -y
updatedb
yum -y update && yum -y upgrade

# Fim preparação Linux

### TEMA EMPRESA

# Inicio instalação tema Life

wget -c https://github.com/patryckpinhal/issabel-construtor/raw/main/tema-life.tgz
tar zvxf tema-life.tgz
rm -f tema-life.tgz
mv /home/script/mainstyle.css /var/www/html/modules/pbxadmin/themes/default/css/ -f
mv /home/script/CloudPabx2/ /var/www/html/themes/

# Fim instalação tema Life

### PREPARANDO SNGREP

# Incio preparando sngrep

echo ""
echo "Instalando sngrep"
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

# Fim preparando sngrep

### FAIL2BAN
# Inicio preparando banir.sh
# wget -c https://raw.githubusercontent.com/patryckpinhal/issabel-construtor/main/banir.sh
# chmod +x banir.sh
# chown -R root:root banir.sh
# int5_esc=$(echo $int5 | sed 's/\//\\\//g')
# sed -i "s/trocarip/$int5_esc/g" /home/script/banir.sh
# sed -i "s/trocarporta/$int6/g" /home/script/banir.sh
# Fim preparando banir.sh

### IPTABLES

# Inicio preparando iptables.sh

wget -c https://raw.githubusercontent.com/patryckpinhal/issabel-construtor/main/iptables.sh
chmod +x iptables.sh
chown -R root:root iptables.sh

# Fim preparando iptables.sh

### RESETF2B

# Inicio preparapando resetf2b.sh

wget -c https://raw.githubusercontent.com/patryckpinhal/issabel-construtor/main/resetf2b.sh
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

# Fim alterando porta SSH do arquivo ssh_config

### INSTALAÇÃO MONITFILAS E DOWNGRAVACOES

# Inicio preparação banco

wget -c https://github.com/patryckpinhal/issabel-construtor/raw/main/sql.tgz
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

wget -c https://github.com/patryckpinhal/issabel-construtor/raw/main/monitdown.tgz
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

echo "Tudo pronto!"
