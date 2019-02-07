# Check Update Slackware
#### Simples Hack que envia notificações na área de trabalho quando tem atualizações a fazer no sistema!

## Modo de uso
* Baixe o Script para sua máquina na localização que você quiser.
* No script existe uma variável chamada **user** indique o nome do seu usuário, é importante para conseguir enviar a notificação para o mesmo.
* Adicione a linha **00 06,09,12,15,18,21,00 * * * /*Localização-Do-Script*/checkupdate.sh** na tabela administrativa do sistema. O mesmo será executado pelo cron nas horas cheias!
* Seja feliz!

## IMPORTANTE
O programa utiliza o notify-send para enviar as notificações. Por isto é de importância que você esteja em modo gráfico.
