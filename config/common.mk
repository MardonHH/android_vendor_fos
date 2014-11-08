PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/fos/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/fos/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/fos/prebuilt/common/bin/50-fos.sh:system/addon.d/50-slim.sh \
    vendor/fos/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/fos/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# fos-specific init file
PRODUCT_COPY_FILES += \
    vendor/fos/prebuilt/common/etc/init.local.rc:root/init.slim.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/fos/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/fos/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/fos/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/fos/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/fos/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/fos/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/fos/prebuilt/common/bin/sysinit:system/bin/sysinit

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam

# DSPManager
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra Optional packages
PRODUCT_PACKAGES += \
    LatinIME \
    BluetoothExt \
    DashClock

#    fosFileManager removed until updated

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
  
# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/fos/overlay/common
