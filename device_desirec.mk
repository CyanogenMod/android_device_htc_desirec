#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS := device/htc/desirec/overlay

# Passion uses high-density artwork where available
PRODUCT_LOCALES += mdpi

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
    
PRODUCT_COPY_FILES += \
    device/htc/desirec/vold.fstab:system/etc/vold.fstab \
    device/htc/desirec/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/desirec/gps.conf:system/etc/gps.conf \
    device/htc/desirec/lights.sh:system/xbin/lights.sh

# proprietary side of the device
$(call inherit-product-if-exists, vendor/htc/desirec/device_desirec-vendor.mk)

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.desirec \
    lights.desirec \
    gralloc.msm7k \
    copybit.msm7k \
    gps.desirec \
    wlan_loader \
    tiwlan.ini \
    dhcpcd.conf \
    VoiceDialer \
    libOmxCore \
    libOmxVidEnc \
    libmm-omxcore \
    desirec-keypad.kcm

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_COPY_FILES += \
    device/htc/desirec/init.desirec.rc:root/init.desirec.rc \
    device/htc/desirec/ueventd.desirec.rc:root/ueventd.desirec.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/desirec/desirec-keypad.kl:system/usr/keylayout/desirec-keypad.kl \
    device/htc/desirec/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.hsxpa=2 \
    ro.ril.hsupa.category=5 \
    ro.ril.enable.a52=1 \
    ro.ril.enable.a53=1 \
    ro.ril.def.agps.mode=2 \
    ro.ril.def.agps.feature=1 \
    ro.ril.gprsclass=12 \
    wifi.interface=tiwlan0

PRODUCT_PROPERTY_OVERRIDES += \
    windowsmgr.max_events_per_sec= 60 \
    windowsmgr.support_rotation_270=true

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=45

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Performences tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=32m \
    ro.compcache.default=0 \
    persist.sys.use_dithering=0

# OpenGL ES 1.1-CM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 65537 \
    debug.sf.hw=1 \
    video.accelerate.hw =1 \
    debug.performance.tuning =1 \
    ro.product.multi_touch_enabled=true

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4 \
    ro.com.google.clientidbase=android-verizon-us \
    ro.com.google.locationfeatures=1 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.home.operator.numeric=310012 \
    ro.cdma.homesystem=128,64 \
    ro.cdma.data_retry_config=default_randomization=960000,960000,960000,960000,960000

# stagefright settings
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true

PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.autobacklight=1 \
    persist.service.mount.playsnd = 0 \
    ro.com.google.locationfeatures = 1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    net.bt.name=Android \
    ro.config.sync=yes

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/desirec/media_profiles.xml:/system/etc/media_profiles.xml

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/desirec/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

KERNEL_NAME := 2.6.29-DecaFuctCFS-dirty-9ff84b92

PRODUCT_COPY_FILES += \
    device/htc/desirec/modules/modules.dep.bb:system/lib/modules/$(KERNEL_NAME)/modules.dep.bb \
    device/htc/desirec/modules/modules.order:system/lib/modules/$(KERNEL_NAME)/modules.order \
    device/htc/desirec/modules/wlan.ko:system/lib/modules/$(KERNEL_NAME)/drivers/net/wireless/tiwlan1251/wlan.ko \
    device/htc/desirec/modules/hid-dummy.ko:system/lib/modules/$(KERNEL_NAME)/drivers/hid/hid-dummy.ko \
    device/htc/desirec/modules/wlan.ko:system/lib/modules/wlan.ko

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)

