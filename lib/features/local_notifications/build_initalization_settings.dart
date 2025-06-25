import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_notification_manager/core/utils/check_platforms.dart';
import 'package:smart_notification_manager/core/utils/get_linux_icon.dart';
import 'package:smart_notification_manager/core/utils/get_linux_sound.dart';
import 'package:smart_notification_manager/features/local_notifications/models/local_notifications_config.dart';

InitializationSettings buildInitalizationSettings({
  LocalNotificationConfig config = const LocalNotificationConfig(),
}) {
  return InitializationSettings(
    android: isAndroid(config.targetPlatforms)
        ? AndroidInitializationSettings(config.androidIconName)
        : null,
    iOS: isIOS(config.targetPlatforms)
        ? DarwinInitializationSettings(
            defaultPresentAlert: config.showAlert,
            defaultPresentBadge: config.showBadge,
            defaultPresentBanner: config.showBanner,
            defaultPresentList: config.showInNotificationsList,
            defaultPresentSound: config.playSound,
            notificationCategories: config.actions,
            requestAlertPermission: config.requestAlertPermission,
            requestBadgePermission: config.requestBadgePermission,
            requestCriticalPermission: config.requestCriticalPermission,
            requestProvisionalPermission: config.requestProvisionalPermission,
            requestSoundPermission: config.requestSoundPermission,
          )
        : null,
    linux: isLinux(config.targetPlatforms)
        ? LinuxInitializationSettings(
            defaultActionName: config.defaultActionName,
            defaultIcon: getLinuxNotificationIcon(config.linuxDefaultIcon),
            defaultSound: getLinuxNotificationSound(config.linuxDefaultSound),
            defaultSuppressSound: config.defaultSuppressSound,
          )
        : null,
    macOS: isMacOS(config.targetPlatforms)
        ? DarwinInitializationSettings(
            defaultPresentAlert: config.showAlert,
            defaultPresentBadge: config.showBadge,
            defaultPresentBanner: config.showBanner,
            defaultPresentList: config.showInNotificationsList,
            defaultPresentSound: config.playSound,
            notificationCategories: config.actions,
            requestAlertPermission: config.requestAlertPermission,
            requestBadgePermission: config.requestBadgePermission,
            requestCriticalPermission: config.requestCriticalPermission,
            requestProvisionalPermission: config.requestProvisionalPermission,
            requestSoundPermission: config.requestSoundPermission,
          )
        : null,
    windows: isWindows(config.targetPlatforms)
        ? WindowsInitializationSettings(
            appName: config.appName,
            appUserModelId: config.appUserModelId,
            guid: config.guid,
            iconPath: config.guid,
          )
        : null,
  );
}