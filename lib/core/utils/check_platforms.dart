import 'package:smart_notification_manager/enums/enums.dart';

bool isWindows(Set<TargetPlatform> targetPlatforms) {
  return targetPlatforms.contains(TargetPlatform.windows);
}

bool isMacOS(Set<TargetPlatform> targetPlatforms) {
  return targetPlatforms.contains(TargetPlatform.macOS);
}

bool isLinux(Set<TargetPlatform> targetPlatforms) {
  return targetPlatforms.contains(TargetPlatform.linux);
}

bool isIOS(Set<TargetPlatform> targetPlatforms) {
  return targetPlatforms.contains(TargetPlatform.iOS);
}

bool isAndroid(Set<TargetPlatform> targetPlatforms) {
  return targetPlatforms.contains(TargetPlatform.android);
}
