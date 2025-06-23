import 'package:smart_notification_manager/core/utils/get_schedule_notifications_permissions.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addReschedulePermission() {
  List<String> permissions = getScheduleNotificationsPermissions();
  final int line = '<manifest'.getLineIndexIn(ManifestFile().lines);
  ManifestFile().lines.insert(
    line + 1,
    permissions[0].padLeft(permissions[0].length + 4),
  );
}