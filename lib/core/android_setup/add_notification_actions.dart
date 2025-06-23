import 'package:smart_notification_manager/core/utils/convert_user_answer.dart';
import 'package:smart_notification_manager/core/utils/create_terminal_message.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addNotificationAction() {
  final String actionReceiver =
      '<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver" />';
  final int manifestDeclarationLineNumber = '</application>'.getLineIndexIn(
    ManifestFile().lines,
  );
  final bool isActionEnabled = "ActionBroadcastReceiver".existsInLines(
    ManifestFile().lines,
  );
  if (!isActionEnabled) {
    final String message = "Do you want to support notifications action";
    createTerminalMessage(message, type: TerminalMessageType.question);
    String? answer = getAsnwerFromUser();
    bool isActionSupport = converUserAnswer(answer);

    if (isActionSupport) {
      final String formattedActionReceiver = actionReceiver.padLeft(
        actionReceiver.length + 8,
      );
      ManifestFile().lines.insert(
        manifestDeclarationLineNumber,
        formattedActionReceiver,
      );
      ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
    }
  }
}
