import 'package:smart_notification_manager/core/utils/gradle_file.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';

void updateCompileSdk() {
  final int compileSdkLineIndex = "compileSdk".getLineIndexIn(GradleFile().lines);
  String compileSdkLine = GradleFile().lines[compileSdkLineIndex];
  final String compileSdk = "    compileSdk = 35";
  final bool isCompileSdkBasedOnFlutter = "flutter.compileSdkVersion"
      .existsInLines(GradleFile().lines);

  if (isCompileSdkBasedOnFlutter) {
    GradleFile().lines[compileSdkLineIndex] = compileSdk;
  } else {
    final RegExp sdkRegex = RegExp(r'compileSdk\s*=\s*(\d+)');
    final Match? match = sdkRegex.firstMatch(compileSdkLine);

    if (match != null) {
      final int currentSdk = int.parse(match.group(1)!);
      if (currentSdk < 35) {
        GradleFile().lines[compileSdkLineIndex] = compileSdkLine.replaceFirst(
          RegExp(r'=\s*\d+'),
          '= 35',
        );
      }
    }
  }
  GradleFile().file.writeAsStringSync(GradleFile().lines.join("\n"));
}
