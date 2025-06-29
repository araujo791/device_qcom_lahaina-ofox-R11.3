#
# Copyright (C) 2020 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Este arquivo configura pacotes e propriedades para o TWRP baseado em AOSP
# para o Realme GT2 (codinome lahaina, Snapdragon 888).

# Identificadores do dispositivo (Realme GT2)
PRODUCT_DEVICE := lahaina
PRODUCT_NAME := twrp_lahaina
PRODUCT_BRAND := realme
PRODUCT_MODEL := REALME_lahaina
PRODUCT_MANUFACTURER := realme

# Caminho para configurações específicas do dispositivo
DEVICE_PATH := device/realme/lahaina

# Configurações base do Android (AOSP)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)  # Realme GT2 é 64-bit

# Chaves GSI para boot verificado (opcional, remova se não necessário)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Suporte a partições A/B com vendor ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Suporte a armazenamento emulado
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configurações do TWRP
$(call inherit-product, vendor/twrp/config/common.mk)

# Níveis de API (baseado em Android 12, ajuste se necessário)
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 31

# Suporte a partições A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    odm \
    vendor \
    vendor_boot

# Pacotes necessários para A/B e recovery
PRODUCT_PACKAGES += \
    bootctrl.lahaina.recovery \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctl \
    fastbootd \
    android.hardware.fastboot@1.0-impl

# Suporte a partições dinâmicas
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Arquivos pré-construídos (DTB para Snapdragon 888)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/lahaina/dtb.img:dtb.img

# Timezone data para TWRP
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# Firmware específico para lahaina
TWRP_REQUIRED_MODULES += lahaina_firmware

# Propriedade do dispositivo
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.device.name=lahaina

# Namespaces para Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)