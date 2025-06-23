import 'dart:io';
import 'package:smart_notification_manager/core/utils/add_exact_time_permission.dart';
import 'package:smart_notification_manager/core/utils/add_reschedule_permission.dart';
import 'package:smart_notification_manager/core/utils/add_schedule_notifications_receiver.dart';
import 'package:smart_notification_manager/core/utils/convert_user_answer.dart';
import 'package:smart_notification_manager/core/utils/create_terminal_message.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/line_index_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addScheduleNotificationConfiguration() {
  final int line = '<manifest'.getLineIndexIn(ManifestFile().lines);

  if (line.isLineNotExist()) {
    print("mainfest tag not exist");
    exit(0);
  }

  final bool isPermissionAdded = "RECEIVE_BOOT_COMPLETED".existsInLines(
    ManifestFile().lines,
  );

  if (!isPermissionAdded) {
    createTerminalMessage("Do you want your app schedule notifications (y/n)");
    final String? answer1 = getAsnwerFromUser();
    final bool isScheduleSupport = converUserAnswer(answer1);

    if (isScheduleSupport) {
      addReschedulePermission();
      addScheduleNotificationReceiver();

      createTerminalMessage("Do you want make schedule notifications in exact time ? (y/n)");
      final String? answer2 = getAsnwerFromUser();
      final bool isExactTimeSupport = converUserAnswer(answer2);

      if (isExactTimeSupport) {
        createTerminalMessage("Do you want exact time notifications granted by user or by yourself ? (y/n)");
        String? answer = getAsnwerFromUser();
        bool isGrantedByUser = converUserAnswer(answer);

        addExactTimePermissions(isGrantedByUser);
      }
    }

    ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
  }
}




