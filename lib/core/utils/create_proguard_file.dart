import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/proguard_file.dart';

void createProguardFile() {
  const List<String> lines = <String>[
    '-keepattributes InnerClasses',
    '-keep class **.R',
    '-keep class **.R\$* { <fields>; }',
  ];

  final bool isProguardContentAdded = lines[0].existsInLines(
    ProguardFile().lines,
  );

  if (ProguardFile().isNotExist) {
    ProguardFile().file.createSync(recursive: true);
  }

  if (!isProguardContentAdded) {
    ProguardFile().file.writeAsStringSync(ProguardFile().lines.join('\n'));
  }
}
