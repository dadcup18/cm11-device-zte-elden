# inherit from the proprietary version
-include vendor/zte/elden/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH += device/zte/elden/include

TARGET_PREBUILT_HEADERS := true

TARGET_PROVIDES_INIT_RC := true

# General
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := elden
TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := elden

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_NEON := true

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_CAMERA_USE_MM_HEAP := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB


# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/elden/bluetooth

# Display/Graphics
TARGET_QCOM_DISPLAY_VARIANT := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

# egl
BOARD_EGL_CFG := device/zte/elden/prebuilts/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USE_QCOM_PMEM := true
TARGET_QCOM_HDMI_OUT := true
TARGET_USES_QCOM_LPA := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ROTATOR_KERNEL_FORMATS

# Media
TARGET_QCOM_MEDIA_VARIANT := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_ION_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# HWComposer
BOARD_USES_HWCOMPOSER := true
TARGET_NO_HW_VSYNC := true

# JIT / Optimizations
WITH_DEXPREOPT := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8

# Wifi
# HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_SOFTAP_DEVICE := qcwcn 
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME :=  wlan
WIFI_DRIVER_MODULE_PATH :=  "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)


# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 loglevel=7 kgsl.mmutype=gpummu
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01300000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_PREBUILT_KERNEL := device/zte/elden/kernel
TARGET_KERNEL_SOURCE := kernel/zte/elden
TARGET_KERNEL_CONFIG := elden_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3

# Partitions
# Get values by examining /proc/partitions on a running device & multiply by 1024
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 480018432
BOARD_CACHEIMAGE_PARTITION_SIZE := 318767104
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2793406464
BOARD_PERSISTIMAGE_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/vold/179:33
BOARD_WANTS_EMMC_BOOT := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := false
BOARD_VOLD_MAX_PARTITIONS := 36

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/elden/recovery/kernel
TARGET_RECOVERY_FSTAB := device/zte/elden/recovery/fstab.elden
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_RECOVERY_SWIPE := true

PHILZ_TOUCH_RECOVERY := true
TARGET_COMMON_NAME := Avid 4G
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"


# Releasetools
#TARGET_PROVIDES_RELEASETOOLS := true
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/zte/elden/releasetools/elden_ota_from_target_files

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/zte/elden/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    file.te \
    hci_init.te \
    healthd.te \
    init_shell.te \
    init.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa_socket.te \
    wpa.te 
  
