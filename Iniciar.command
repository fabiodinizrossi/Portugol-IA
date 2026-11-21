#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
fail() { echo "$1"; read -r -p "Pressione Enter para fechar…" _; exit 1; }
command -v java >/dev/null || fail "Java não encontrado. Instale um JDK 11 ou superior."
[[ -f Portugol.jar ]] || fail "Coloque o Portugol.jar original nesta pasta."
if ! curl -fsS --max-time 2 http://127.0.0.1:11434/api/tags >/dev/null 2>&1; then
  if command -v ollama >/dev/null; then
    ollama serve >ollama-inicializacao.log 2>&1 &
  elif [[ -d /Applications/Ollama.app ]]; then
    open -a Ollama
  else
    fail "Ollama não encontrado. Abra o Ollama e tente novamente."
  fi
  ready=0
  for ((i=0;i<30;i++)); do
    if curl -fsS --max-time 2 http://127.0.0.1:11434/api/tags >/dev/null 2>&1; then ready=1; break; fi
    sleep 1
  done
  [[ "$ready" == 1 ]] || fail "O Ollama não respondeu. Consulte ollama-inicializacao.log."
fi
if [[ ! -f AssistentePortugol.jar ]]; then
  command -v javac >/dev/null || fail "JDK com javac necessário para compilar o assistente."
  mkdir -p classes
  javac --release 11 -encoding UTF-8 -d classes src/Assistente.java
  cp exemplos.txt classes/
  jar cfm AssistentePortugol.jar manifest.mf -C classes .
fi
java -Dassistente.config="$PWD/assistente.properties" -javaagent:"$PWD/AssistentePortugol.jar" -jar "$PWD/Portugol.jar" || fail "O Java encerrou com erro. Veja a mensagem acima."
