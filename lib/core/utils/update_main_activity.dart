import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/main_activity_file.dart';

void updateMainActivity() {
  "Notifications.createNotificationChannels(this)".existsInLines(
    MainActivityFile().lines,
  );

  MainActivityFile().file.writeAsStringSync(
    MainActivityFile.getUpdatedContent(),
  );
}
