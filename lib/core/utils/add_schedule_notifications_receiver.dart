import 'package:smart_notification_manager/core/utils/get_schedule_notifications_receiver.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addScheduleNotificationReceiver() {
  final receiver = getScheduleNotificationReceiver();
  final int line = "</application>".getLineIndexIn(ManifestFile().lines);
  ManifestFile().lines.insert(line, receiver);
  ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
}
