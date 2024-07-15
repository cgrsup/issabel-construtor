#!/bin/bash
#

while true; do
    echo "############################################################"
    echo "##                 SCRIPT IPTABLES ISSABEL                ##"
    echo "############################################################"
    echo "#"
    echo "#       Gostaria de realizar as liberações utilizando"
    echo "#              os padrão dos servidores Life?"
    echo "#                        (sim/nao)"
    read -p "#" int99

    if [[ $int99 == "nao" ]]; then
        echo "#               Você digitou "nao"!"
        echo "#       Responda as perguntas corretamente. "
        read -p "# 1 - Digite o IP utilizado para acesso: " int1
        read -p "# 2 - Digite a Porta SSH utilizada: " int2
        read -p "# 3 - Digite o IP do servidor SNMP: " int3
        echo "############################################################"
        echo "#               Você digitou:"
        echo "# IP utilizado para acesso........= $int1"
        echo "# Porta SSH utilizada.............= $int2"
        echo "# IP servidor SNMP................= $int3"
        echo "############################################################"
        echo "##               INICIANDO AS CONFIGURAÇÕES               ##"
        echo "############################################################"

        #Limpando regras existentes no iptables.
        echo "# Limpando regras existentes..."
        iptables -F
        iptables -X

        # Acessos VPN
        echo "# Permitindo o IP de acesso: $int1"
        iptables -A INPUT -s $int1 -j ACCEPT

        # Ping PRTG
        echo "# Liberando ping origem: $int3"
        iptables -A INPUT -p icmp -s $int3 -j ACCEPT

        # Liberação localhost
        echo "# Liberando localhost 127.0.0.1"
        iptables -A INPUT -s 127.0.0.1 -j ACCEPT

        # Bloqueio portas
        echo "# Bloqueando todo acesso na porta: $int2"
        iptables -A INPUT -p tcp --dport $int2 -j DROP      # Porta SSH TCP
        iptables -A INPUT -p udp --dport $int2 -j DROP      # Porta SSH UDP
        break

    elif [[ $int99 == "sim" ]]; then
        while true; do
            echo "#               Você digitou "sim"!"

            # Solicita a senha do usuário
            read -sp "# Digite a senha para descriptografar os IPs Life: " senha
            echo

            # URL do arquivo GPG
            url="https://github.com/cgrsup/issabel-construtor/raw/main/life.sh.gpg"

            # Nome do arquivo baixado
            arquivo_gpg="life.sh.gpg"

            # Nome do arquivo descriptografado temporário
            arquivo_descriptografado="life.sh"

            # Baixa o arquivo GPG
            wget --quiet --output-document="$arquivo_gpg" "$url"

            # Verifica se o arquivo foi baixado com sucesso
            if [[ -f "$arquivo_gpg" ]]; then
                # Tenta descriptografar o arquivo com a senha fornecida
                echo "$senha" | gpg --batch --yes --passphrase-fd 0 --output "$arquivo_descriptografado" "$arquivo_gpg"

                # Verifica se a descriptografia foi bem-sucedida
                if [[ $? -eq 0 ]]; then
                    # Limpando iptables
                    echo "# Limpando regras existentes..."
                    iptables -F
                    iptables -X

                    # Liberação localhost
                    echo "# Liberando localhost 127.0.0.1"
                    iptables -A INPUT -s 127.0.0.1 -j ACCEPT

                    # Transformando arquivo em executável
                    chmod +x "$arquivo_descriptografado"

                    # Rodando o arquivo
                    echo "# Executando IPs Life!"
                    ./life.sh

                    # Remove o arquivo baixado e o arquivo descriptografado por segurança
                    rm -f "$arquivo_gpg" "$arquivo_descriptografado"
                    break
                else
                    echo "#!!! Senha incorreta ou falha na descriptografia. Tente novamente!!!"
                fi
            else
                echo "#!!!Falha ao baixar o arquivo. Tente novamente!!!"
            fi
        done
        break

    else
        echo "#!!!Resposta inválida. Por favor, digite 'sim' ou 'nao'!!!"
    fi
done

# Bloqueio portas
echo "# Bloqueando portas: 5060, 3306, 20005 e 8088!!!"
iptables -A INPUT -p tcp --dport 5060 -j DROP       # Porta SIP TCP
iptables -A INPUT -p udp --dport 5060 -j DROP       # Porta SIP UDP
iptables -A INPUT -p tcp --dport 3306 -j DROP       # Porta MySQL TCP
iptables -A INPUT -p udp --dport 3306 -j DROP       # Porta MySQL UDP
iptables -A INPUT -p tcp --dport 20005 -j DROP      # Porta Open Webnet TCP
iptables -A INPUT -p udp --dport 20005 -j DROP      # Porta Open Webnet UDP
iptables -A INPUT -p tcp --dport 8088 -j DROP       # Porta Web Socket TCP
iptables -A INPUT -p udp --dport 8088 -j DROP       # Porta Web Socket UDP

# Bloqueio ping
echo "# Bloqueando ping de todas as origens!"
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# Liberando porta 5060
echo "# Liberando range de ips utilizados por clientes!"
wget -O - https://raw.githubusercontent.com/cgrsup/issabel-construtor/main/ips-liberados.sh | bash

# Validar se existe o arquivo de ips particulares, caso não, criar
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
    echo "#!!! O arquivo $validar foi criado com sucesso."
fi

echo "############################################################"
echo "##              !!!   SCRIPT FINALIZADO   !!!             ##"
echo "############################################################"
