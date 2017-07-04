#!/bin/bash

# Busca por um container em uma Maquina
# Exemplo:
# chmod +x which_machine.sh
# ./which_machine.sh usuario senha container_que_procura na_maquina1 na_maquina2 na_maquina3

# caso você não possua o sshpass instalado, faça a instalação conforme a linha abaixo
# sudo yum install sshpass

USER=$1
PASS=$2
CONTAINER=$3
MACHINES="${@:4}"

for MACHINE in $MACHINES
do
   TOTAL=$(sshpass -p $PASS ssh -o StrictHostKeyChecking=no $USER@$MACHINE sudo docker ps | grep $CONTAINER | wc -l)
   if [ $TOTAL == 1 ]; then
    echo "Container $CONTAINER esta na maquina $MACHINE"
   fi
done