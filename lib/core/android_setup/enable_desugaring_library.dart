import 'dart:io';

import 'package:smart_notification_manager/core/utils/gradle_file.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/line_index_helper.dart';

void enableCoreLibraryDesugaring() {
  final int lineNumber = "compileOptions".getLineIndexIn(GradleFile().lines);
  if (lineNumber.isLineNotExist()) {
    print("Error: Could not find the compileOptions section.");
    exit(0);
  }
  final bool isDesugaringEnabled = "isCoreLibraryDesugaringEnabled".existsInLines(GradleFile().lines);
  final String coreLibraryDesugaringLine =
      "isCoreLibraryDesugaringEnabled = true";
  final int firstLineInCompileOptionsScope = lineNumber + 1;
  final int linePadding = coreLibraryDesugaringLine.length + 8;
  final String formattedLine = coreLibraryDesugaringLine.padLeft(linePadding);
  if (!isDesugaringEnabled) {
    GradleFile().lines.insert(firstLineInCompileOptionsScope, formattedLine);
    GradleFile().file.writeAsStringSync(GradleFile().lines.join("\n"));
  }
}
