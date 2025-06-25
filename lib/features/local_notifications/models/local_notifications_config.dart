import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_notification_manager/enums/enums.dart';

class LocalNotificationConfig {
  final Set<TargetPlatform> targetPlatforms;
  final String androidIconName;
  final String defaultActionName;
  final bool showAlert;
  final bool showBadge;
  final bool showBanner;
  final bool showInNotificationsList;
  final bool playSound;
  final List<DarwinNotificationCategory> actions;
  final bool requestAlertPermission;
  final bool requestBadgePermission;
  final bool requestCriticalPermission;
  final bool requestProvisionalPermission;
  final bool requestSoundPermission;
  final LinuxDefaultIcon? linuxDefaultIcon;
  final LinuxDefaultSound? linuxDefaultSound;
  final bool defaultSuppressSound;
  final String appName;
  final String appUserModelId;
  final String guid;
  final String? iconPath;

  const LocalNotificationConfig({
    this.targetPlatforms = const {TargetPlatform.android},
    this.androidIconName = "@mipmap/ic_launcher",
    this.defaultActionName = "Flutter App",
    this.showAlert = true,
    this.showBadge = true,
    this.showBanner = true,
    this.showInNotificationsList = true,
    this.playSound = true,
    this.actions = const <DarwinNotificationCategory>[],
    this.requestAlertPermission = true,
    this.requestBadgePermission = true,
    this.requestCriticalPermission = false,
    this.requestProvisionalPermission = false,
    this.requestSoundPermission = true,
    this.linuxDefaultIcon,
    this.linuxDefaultSound,
    this.defaultSuppressSound = false,
    this.appName = "Flutter App",
    this.appUserModelId = "",
    this.guid = "",
    this.iconPath,
  });
}