import 'package:smart_notification_manager/core/utils/convert_user_answer.dart';
import 'package:smart_notification_manager/core/utils/create_terminal_message.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void ignoreDontDistrubMode() {
  final bool isAttributesAdded = "ACCESS_NOTIFICATION_POLICY".existsInLines(
    ManifestFile().lines,
  );

  if (!isAttributesAdded) {
    final String message =
        "Do you want  ignore the device's Do Not Disturb mode ? (y/n)";
    createTerminalMessage(message, type: TerminalMessageType.question);
    String? answer = getAsnwerFromUser();
    bool isLockedAndTurnOnSupport = converUserAnswer(answer);
    if (isLockedAndTurnOnSupport) {
      final String permission =
          '<uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY" />';
      final int activityLineNumber = '<manifest'.getLineIndexIn(
        ManifestFile().lines,
      );
      ManifestFile().lines.insert(
        activityLineNumber + 1,
        permission.padLeft(permission.length + 4),
      );
      ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
    }
  }
}
