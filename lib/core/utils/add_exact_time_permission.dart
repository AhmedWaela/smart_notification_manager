import 'package:smart_notification_manager/core/utils/get_schedule_notifications_permissions.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addExactTimePermissions(bool isGrantedByUser) {
  List<String> permissions = getScheduleNotificationsPermissions();
  final int line = '<manifest'.getLineIndexIn(ManifestFile().lines);
  if (isGrantedByUser) {
    ManifestFile().lines.insert(
      line + 1,
      permissions[1].padLeft(permissions[1].length + 4),
    );
  } else {
    ManifestFile().lines.insert(
      line + 1,
      permissions[2].padLeft(permissions[2].length + 4),
    );
  }
}