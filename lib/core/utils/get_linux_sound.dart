import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_notification_manager/enums/enums.dart';

LinuxNotificationSound? getLinuxNotificationSound(
  LinuxDefaultSound? sound, {
  String? relativePath,
  String? name,
}) {
  switch (sound) {
    case LinuxDefaultSound.assets:
      return AssetsLinuxSound(relativePath!);
    case LinuxDefaultSound.theme:
      return ThemeLinuxSound(name!);
    case null:
      return null;
  }
}