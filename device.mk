#
# Copyright (C) 2017 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, vendor/oneplus/cheeseburger/cheeseburger-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml

# Init
PRODUCT_PACKAGES += \
    init.target.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fpc1020.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fpc1020.kl \
    $(LOCAL_PATH)/keylayout/gf_input.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gf_input.kl \
    $(LOCAL_PATH)/keylayout/synaptics_s3320.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_s3320.kl

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.cheeseburger

# Wifi
PRODUCT_PACKAGES += \
    CheeseburgerWifiOverlay

# Inherit from oneplus msm8998-common
$(call inherit-product, device/oneplus/msm8998-common/common.mk)

# Dexpreopt: system partition is 3 GB, keep room for GApps.
# Apps are compiled on device (bg-dexopt); boot images and system_server stay preopted.
CHEESEBURGER_NO_PREOPT_APPS := \
    ANGLE AccessibilityMenu AntHalService-Soong Aperture ApertureLensLauncher AudioFX AvatarPicker \
    BackupRestoreConfirmation BasicDreams BatteryStatsViewer BlockedNumberProvider BluetoothMidiService \
    BookmarkProvider BuiltInPrintService CalendarProvider CallLogBackup Camelot CameraExtensionsProxy \
    CaptivePortalLogin CarrierConfig CarrierDefaultApp CellBroadcastLegacyApp CertInstaller \
    ColumbusService CompanionDeviceManager ContactsProvider CredentialManager DeskClock \
    DeviceDiagnostics DeviceSettings DocumentsUI DownloadProvider DownloadProviderUi \
    DynamicSystemInstallationService E2eeContactKeysProvider EasterEgg EmergencyInfo ExtShared \
    ExternalStorageProvider FaceUnlock FusedLocation GameSpace HTMLViewer ImsServiceEntitlement \
    InputDevices IntentResolver Jelly KeyChain LMOFreeform LMOFreeformSidebar LatinIME \
    Launcher3QuickStep LineageParts LineageSettingsProvider LineageSetupWizard LiveWallpapersPicker \
    LocalContactsBackup LocalTransport ManagedProvisioning MatLog MediaProviderLegacy MmsService \
    MtpService NetworkStack ONS OmniJaws OmniStyle OnePlusDoze OnePlusPocketMode PacProcessor \
    PackageInstaller PhotoTable PrintRecommendationService PrintSpooler Profiles ProxyHandler \
    QuickAccessWallet Recorder SecureElement Settings SettingsIntelligence SettingsProvider \
    SharedStorageBackup Shell SimAppDialog SimpleDeviceConfig SimpleSettingsConfig SoundPicker \
    StatementService Stk StorageManager SystemUI Tag TeleService Telecom TelephonyProvider ThemePicker \
    Twelve Updater UserDictionaryProvider VpnDialogs WAPPushManager WallpaperBackup webview

$(call add-product-dex-preopt-module-config,$(CHEESEBURGER_NO_PREOPT_APPS),disable)
