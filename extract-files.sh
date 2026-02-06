#!/bin/bash

# Configurações de Caminho
DUMP_SRC="/media/anderson/Android/Sources/3312/out"
TREE_ROOT="$(pwd)"

# Cores para o log
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NORMAL='\033[0m'

if [ ! -d "$DUMP_SRC" ]; then
    echo -e "${RED}Erro: Pasta do dump não encontrada em $DUMP_SRC${NORMAL}"
    exit 1
fi

echo -e "${GREEN}>> Iniciando extração para Lahaina...${NORMAL}"

while read -r line; do
    # Pula comentários e linhas vazias
    [[ "${line}" =~ ^#.*$ ]] && continue
    [[ -z "${line}" ]] && continue

    # Lógica de Mapeamento:
    # Se a linha começa com recovery/root/system/... o arquivo no dump está em system/...
    # Se a linha começa com recovery/root/vendor/... o arquivo no dump está em vendor/...
    # Se a linha começa com prebuilt/lahaina/Image o arquivo no dump está em boot.img (extraído como kernel ou Image)
    
    DEST_FILE="$TREE_ROOT/$line"
    
    # Descobre o caminho relativo no dump
    if [[ "$line" == recovery/root/* ]]; then
        RELATIVE_PATH=$(echo "$line" | sed 's|recovery/root/||')
    elif [[ "$line" == prebuilt/lahaina/* ]]; then
        # Para kernel e dtb, geralmente o dumper.sh extrai com nomes fixos
        RELATIVE_PATH=$(echo "$line" | sed 's|prebuilt/lahaina/||')
    else
        RELATIVE_PATH="$line"
    fi

    SRC_FILE="$DUMP_SRC/$RELATIVE_PATH"

    # Caso especial para o Kernel (Image)
    if [[ "$RELATIVE_PATH" == "Image" && ! -f "$SRC_FILE" ]]; then
        SRC_FILE="$DUMP_SRC/kernel" # Tenta 'kernel' se 'Image' não existir
    fi

    if [ -f "$SRC_FILE" ]; then
        mkdir -p "$(dirname "$DEST_FILE")"
        cp "$SRC_FILE" "$DEST_FILE"
        echo -e "${GREEN}Copiado:${NORMAL} $RELATIVE_PATH -> $line"
    else
        echo -e "${YELLOW}Aviso:${NORMAL} $RELATIVE_PATH não encontrado no dump (esperado em $SRC_FILE)"
    fi

done < proprietary-files.txt

echo -e "${GREEN}>> Extração concluída!${NORMAL}"
