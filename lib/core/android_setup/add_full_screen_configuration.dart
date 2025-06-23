import 'package:smart_notification_manager/core/utils/add_full_screen_attrributes.dart';
import 'package:smart_notification_manager/core/utils/convert_user_answer.dart';
import 'package:smart_notification_manager/core/utils/create_terminal_message.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';
import 'package:smart_notification_manager/core/utils/insert_full_screen_permission.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addFullScreenNotificationsConfig() {
  final bool isPermissionAdded = "USE_FULL_SCREEN_INTENT".existsInLines(
    ManifestFile().lines,
  );

  if (!isPermissionAdded) {
    final String message =
        "Do you intend notifications as full-screen intent? (y/n)";
    createTerminalMessage(message, type: TerminalMessageType.question);
    String? answer = getAsnwerFromUser();
    bool isHasIntent = converUserAnswer(answer);

    if (isHasIntent) {
      insertFullScreenPermissionToMainfest();

      final String message =
          "Do you want full screen botification appear while device locked and trun on ? (y/n)";
      createTerminalMessage(message, type: TerminalMessageType.question);
      String? answer = getAsnwerFromUser();
      bool isLockedAndTurnOnSupport = converUserAnswer(answer);
      addFullScreenAttributes(isLockedAndTurnOnSupport);
    }
  }
}
