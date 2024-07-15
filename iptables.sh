#!/bin/bash
#

while true; do

read -p "# Digite o IP utilizado para acesso Life: " int1
read -p "# Digite a Porta SSH utilizada: " int2
read -p "# Digite o IP do servidor SNMP: " int3

clear
echo " "
echo " - IP utilizado para acesso Life...= $int1 "
echo " - Porta SSH utilizada.............= $int2 "
echo " - IP servidor SNMP................= $int3 "

echo " "
read -p "Caso as informações estejam corretas, digite 'sim', caso deseja corrigir, digite 'nao': " int66

	if [[ $int66 == "nao" ]]; then
		echo "Reiniciando o script!"

	elif [[ $int66 == "sim" ]]; then
		echo "Continuando o script!"
		break
	else
		echo "Resposta inválida. Por favor, digite 'sim' ou 'nao'."
	fi
done

iptables -F
iptables -X

#Acessos VPN
echo Permitindo o IP de acesso: $int1
iptables -A INPUT -s $int1 -j ACCEPT

#Ping PRTG
echo Liberando ping prtg $int3
iptables -A INPUT -p icmp -s $int3 -j ACCEPT

#Liberação localhost
iptables -A INPUT -s 127.0.0.1 -j ACCEPT

#Bloqueio portas
iptables -A INPUT -p tcp --dport $int2 -j DROP      #porta ssh tcp
iptables -A INPUT -p udp --dport $int2 -j DROP      #porta ssh udp
iptables -A INPUT -p tcp --dport 5060 -j DROP       #porta sip tcp
iptables -A INPUT -p udp --dport 5060 -j DROP       #porta sip udp
iptables -A INPUT -p tcp --dport 3306 -j DROP       #porta mysql tcp
iptables -A INPUT -p udp --dport 3306 -j DROP       #porta mysql udp
iptables -A INPUT -p tcp --dport 20005 -j DROP      #porta open webnet tcp
iptables -A INPUT -p udp --dport 20005 -j DROP      #porta open webnet udp
iptables -A INPUT -p tcp --dport 8088 -j DROP       #porta web socket tcp
iptables -A INPUT -p udp --dport 8088 -j DROP       #porta web socket udp

#Bloqueio ping
echo Bloqueando ping
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

#Liberando porta 5060
echo Liberando range de ips utilizados por clientes
wget -O - https://raw.githubusercontent.com/patryckpinhal/issabel-construtor/main/ips-liberados.sh | bash


#Validar se existe o arquivo de ips particulares, caso não, criar

validar="/home/script/ips-clientes.sh"

if [ -e "$validar" ]; then
    echo "O arquivo $validar já existe."
        cd /home/script/
        ./ips-clientes.sh
else
    echo "#!/bin/bash" > "$validar"
    echo "#" >> "$validar"
    echo "#iptables -I INPUT -s X.X.X.X -p tcp --dport XXXX -j ACCEPT" >> "$validar"
    chmod +x "$validar"
    echo "O arquivo $validar foi criado com sucesso."
fi
