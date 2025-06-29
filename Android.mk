#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Este arquivo é o ponto de entrada para o build do TWRP baseado em AOSP
# para o Realme GT2 (codinome lahaina, Snapdragon 888).
# Inclui todos os makefiles no diretório do device tree.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter lahaina,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif