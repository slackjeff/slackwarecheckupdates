#!/usr/bin/env bash
#========================HEADER============================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha
#
#Descrição
# Simples programinha que utiliza o notify-send para alertar se existe
# updates a serem feitos no sistema. O programa executa o slackpkg com
# a opção check-updates
#
#DICA
# Para melhor uso deste programa, é de extrema importancia adicionar o
# mesmo no cron, neste exemplo rodamos nas horas cheias o programa!
# Coloque em seu crontab administrativo a seguinte linha:
#
# 00 06,09,12,15,18,21,00 * * * /LOCALIZACAO_DO_SCRIPT/checkupdate.sh
#
#==========================================================================|

#============VARS
export DISPLAY=':0.0'
user='slackjeff' # Nome do seu usuário

# Pegando caminho absoluto dos aplicativos.
SLACKPKG="$(which slackpkg)"
GREP="$(which grep)"

#============INICIO
if [ "$LANG" = "pt_BR" ]; then
    msg="Existe Atualizações disponíveis. Execute 'slackpkg upgrade-all'"
else
    msg="Have Updates. Run 'slackpkg upgrade-all'"
fi

if $SLACKPKG check-updates | $GREP -q "News on ChangeLog.txt"; then
    su "$user" -c "/usr/bin/notify-send -i terminal \"$msg\""
fi

rm /var/lock/slackpkg* &>/dev/null # Se existir remover a trava.
