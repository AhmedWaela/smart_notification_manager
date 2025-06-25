import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_notification_manager/enums/enums.dart';

LinuxNotificationIcon? getLinuxNotificationIcon(
  LinuxDefaultIcon? icon, {
  String? relativePath,
  Uint8List? data,
  int? width,
  int? height,
  String? name,
  String? path,
}) {
  switch (icon) {
    case LinuxDefaultIcon.assets:
      return AssetsLinuxIcon(relativePath!);
    case LinuxDefaultIcon.byteData:
      return ByteDataLinuxIcon(
        LinuxRawIconData(data: data!, width: width!, height: height!),
      );
    case LinuxDefaultIcon.theme:
      return ThemeLinuxIcon(name!);
    case LinuxDefaultIcon.filePath:
      return FilePathLinuxIcon(path!);
    case null:
      return null;
  }
}