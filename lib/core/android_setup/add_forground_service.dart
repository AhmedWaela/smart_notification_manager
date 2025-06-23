import 'package:smart_notification_manager/core/utils/convert_user_answer.dart';
import 'package:smart_notification_manager/core/utils/create_terminal_message.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void useForegroundService() {
  final bool isAttributesAdded = "foregroundServiceType".existsInLines(
    ManifestFile().lines,
  );

  if (!isAttributesAdded) {
    final String message = "Do you want add forground service ? (y/n)";
    createTerminalMessage(message, type: TerminalMessageType.question);
    String? answer = getAsnwerFromUser();
    bool isHeWantAddService = converUserAnswer(answer);

    if (isHeWantAddService) {
      final String message1 = "write forground service name";
      createTerminalMessage(message1, type: TerminalMessageType.question);
      String? answer1 = getAsnwerFromUser();
      while (answer1?.isEmpty ?? true) {
        print("please write foreground service name");
        answer1 = getAsnwerFromUser();
      }
      //---------------------------------------------//
      final String message = "write forgroud service type";
      createTerminalMessage(message, type: TerminalMessageType.question);
      String? answer2 = getAsnwerFromUser();
       while (answer2?.isEmpty ?? true) {
        print("please write foreground service type");
        answer2 = getAsnwerFromUser();
      }
      final int applicationLine = '</application'.getLineIndexIn(
        ManifestFile().lines,
      );
      //-------------------------------------------//
      final String message3 = "Do you want service stop while app stoped (y/n)";
      createTerminalMessage(message3, type: TerminalMessageType.question);
      String? answer3 = getAsnwerFromUser();
      final covertedAnswer = converUserAnswer(answer3);
      //--------------------------------------------//
      final String service =
          '''<service
        android:name="$answer1"
        android:exported="false"
        android:stopWithTask="$covertedAnswer"
        android:foregroundServiceType="$answer2">''';
      ManifestFile().lines.insert(applicationLine, service);
      ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
    }
  }
}
