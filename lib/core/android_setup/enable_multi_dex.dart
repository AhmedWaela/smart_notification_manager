import 'dart:io';
import 'package:smart_notification_manager/core/utils/gradle_file.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/line_index_helper.dart';

void enableMultiDex() {
  final int lineNumber = "defaultConfig".getLineIndexIn(GradleFile().lines);

  if (lineNumber.isLineNotExist()) {
    print("Error: Could not find the defaultConfig section.");
    exit(0);
  }

  final bool isMultiDexEnabled = "multiDexEnabled".existsInLines(GradleFile().lines);
  final String enableMultiDexLine = "multiDexEnabled = true";
  final int firstLineInDefaultConfigScope = lineNumber + 1;
  final int linePadding = enableMultiDexLine.length + 8;
  final String formattedLine = enableMultiDexLine.padLeft(linePadding);
  if (!isMultiDexEnabled) {
    GradleFile().lines.insert(firstLineInDefaultConfigScope, formattedLine);
    final String updatedMultiDexContent = GradleFile().lines.join("\n");
    GradleFile().file.writeAsStringSync(updatedMultiDexContent);
  }
}
