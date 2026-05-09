#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
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
# Este arquivo configura o TWRP baseado em AOSP para o Realme GT2
# (codinome lahaina, Snapdragon 888).

# Arquitetura para Realme GT2 (Snapdragon 888)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_VARIANT_RUNTIME := kryo680

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := $(TARGET_ARCH_VARIANT)
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := $(TARGET_CPU_VARIANT_RUNTIME)

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
PRODUCT_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := lahaina  # Codinome ajustado
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Plataforma
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOARD_PLATFORM_GPU := qcom-adreno660
QCOM_BOARD_PLATFORMS += lahaina

# Kernel (pré-compilado para Realme GT2)
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/lahaina/Image

BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    ip6table_raw.raw_before_defrag=1 \
    iptable_raw.raw_before_defrag=1 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    pcie_ports=compat \
    service_locator.enable=1 \
    swiotlb=0 \
    kpti=off

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTB e DTBO
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/lahaina/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/lahaina/dtbo.img

# A/B
TARGET_NO_RECOVERY := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_RECOVERY_AS_BOOT := true

# Assertions
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
# Use uma chave AVB própria para builds públicos
# BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Partições
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_SIZE := 6438256640
BOARD_SUPER_PARTITION_GROUPS := qualcomm_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 6442450944
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_FLASH_BLOCK_SIZE := 131072  # (BOARD_KERNEL_PAGESIZE * 32)
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_DEVICE_MODULES += \
    libdisplayconfig.qti \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    vendor.qti.hardware.tui_comm@1.0
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.qti.hardware.tui_comm@1.0.so

# Criptografia
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2

# Rede
BUILD_BROKEN_USES_NETWORK := true

# Haptics
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

# Ferramentas
TW_INCLUDE_PYTHON := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

# Configurações específicas do TWRP para Realme GT2
TW_THEME := portrait_hdpi  # Tema para tela FHD+ (1080x2400)
TW_DEVICE_VERSION := lahaina-1
RECOVERY_SDCARD_ON_DATA := true
TARGET_USES_LOGD := true
TW_BATTERY_SYSFS_WAIT_SECONDS := 5
TW_EXCLUDE_APEX := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_LOAD_VENDOR_MODULES := "snd_event_dlkm.ko q6_pdr_dlkm.ko q6_notifier_dlkm.ko apr_dlkm.ko q6_dlkm.ko adsp_loader_dlkm.ko msm_drm.ko"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_QCOM_ATS_OFFSET := 1621580431500
TW_DEFAULT_BRIGHTNESS := 1024
TW_MAX_BRIGHTNESS := 2047  # Ajustado para AMOLED
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_NO_EXFAT_FUSE := true
TW_NO_SCREEN_BLANK := true
TW_CUSTOM_BATTERY_POS := 740
TW_CUSTOM_CLOCK_POS := 500
TW_CUSTOM_CPU_POS := 180
TW_FRAMERATE := 60
TW_NO_CPU_TEMP := false
TW_HAS_EDL_MODE := true
TW_Y_OFFSET := 104
TW_H_OFFSET := -104
TW_INCLUDE_FASTBOOTD := true

# Instalador
USE_RECOVERY_INSTALLER := true
RECOVERY_INSTALLER_PATH := device/qcom/lahaina/installer

# Permitir dependências ausentes (para compilação)
ALLOW_MISSING_DEPENDENCIES := true

# Adicione esta flag para garantir que o assert use o nome correto
TARGET_OTA_ASSERT_DEVICE := RE58B2L1,lahaina,RMX3310,RMX3311,RMX3312

