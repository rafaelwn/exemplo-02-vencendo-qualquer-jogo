#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 20
cd /mnt/c/Users/rafae/pos-graduacao-ia/repo-unipos/engenharia-de-software-com-ia-aplicada/modulo01-fundamentos-de-ia-e-llms-para-programadores/exemplo-02-vencendo-qualquer-jogo/DuckHunt-JS-parte02
npx webpack-dev-server --port 8082
