#!/bin/bash

# OrangeFox Building Variables for fox_12.1 (R11.3-compatible)

# Initial Info
 ALLOW_MISSING_DEPENDENCIES=true
 LC_ALL="C"

# Maintaining Info
 OF_MAINTAINER=Covenant_Fuchsia
 FOX_MAINTAINER_PATCH_VERSION=$(date +"%Y%m%d")
 FOX_BUILD_TYPE=Unofficial_Covenant_Fuchsia


# Device Info
 TARGET_ARCH=arm64
 # Confirmado para lahaina (Snapdragon 888)

 #FOX_VARIANT="12.1"
 # Comentado, ajustado para boot abaixo

# Magisk
 FOX_USE_SPECIFIC_MAGISK_ZIP=~/misc/Magisk-v28.1.zip
 # Mantido, mas considere atualizar para v28.1 (R11.3)

# Functions and Binaries
 FOX_REPLACE_TOOLBOX_GETPROP=1
 # Substitui getprop por resetprop

 FOX_USE_TAR_BINARY=1
 # Adiciona gnu tar

 FOX_USE_SED_BINARY=1
 # Adiciona gnu sed

 FOX_USE_BASH_SHELL=1
 # Usa bash como shell padrão

 FOX_ASH_IS_BASH=1
 # Disponibiliza bash como ash

 FOX_USE_GREP_BINARY=1
 # Usa GNU grep

 FOX_USE_XZ_UTILS=1
 # Adiciona XZ Utils

 FOX_USE_NANO_EDITOR=1
 # Adiciona nano prebuilt

 OF_ENABLE_LPTOOLS=1
 # Adiciona lptools (requer repo sync)

 FOX_DELETE_AROMAFM=1
 # Remove AromaFM

 FOX_ENABLE_APP_MANAGER=1
 # Mantido, mas cuidado com Android 11+

 FOX_USE_LZ4_BINARY=1
 # Adiciona lz4 binary (novo)

 FOX_USE_ZSTD_BINARY=1
 # Adiciona zstd binary (novo)

# Display Settings
 OF_HIDE_NOTCH=1
 # Esconde notch

 OF_CLOCK_POS=1
 # Apenas posições de relógio à esquerda e direita

 OF_ALLOW_DISABLE_NAVBAR=0
 # Sem botões de navegação físicos

 OF_USE_GREEN_LED=0
 # Remove LED verde

 OF_SCREEN_H=2400
 # Aspect ratio para tela (mantido)

 OF_STATUS_INDENT_LEFT=48
 # Bordas arredondadas

 OF_STATUS_INDENT_RIGHT=48
 # Bordas arredondadas

# A/B-Related
 FOX_AB_DEVICE=1
 # Dispositivo A/B

 OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
 # Partição de recovery dedicada

 FOX_VANILLA_BUILD=1
 # Build sem patches MIUI
#  FOX_VIRTUAL_AB_DEVICE=1  # Comentado, habilitar apenas se for Virtual A/B nativo

# Other Patches
 OF_NO_RELOAD_AFTER_DECRYPTION=1
 # Evita reiniciar após decriptação

 OF_FBE_METADATA_MOUNT_IGNORE=1
 # Ignora erros de montagem de metadata

 OF_PATCH_AVB20=1
 # Patch AVB 2.0 para A-only (verificar se necessário)

 OF_NO_SPLASH_CHANGE=1
 # Desativa mudança de splash (recomendado para vendor_boot)

 OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
 # Corrige decriptação (mantido para lahaina)

#  FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"  # Removido, obsoleto
 OF_FORCE_PREBUILT_KERNEL=1
 # Evita erro de kernel pré-compilado

 OF_DEFAULT_KEYMASTER_VERSION=4.1
 # Define keymaster para lahaina (ajuste se necessário)

 OF_NO_KEYMASTER_VER_4X=1
 # Desativa merge de keymaster 4.0/4.1 (se necessário)

 OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
 # Desativa checagens MIUI (não-Xiaomi)

 OF_LOOP_DEVICE_ERRORS_TO_LOG=1
 # Erros de loop device para log, não console
