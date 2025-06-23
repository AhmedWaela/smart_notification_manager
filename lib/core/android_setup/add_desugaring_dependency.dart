import 'package:smart_notification_manager/core/utils/gradle_file.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/line_index_helper.dart';

void addCoreLibraryDesugaringDependency() {
  final String dependency =
      'coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")';
  final GradleFile gradleFile = GradleFile();
  final List<String> lines = gradleFile.lines;
  final int dependencyLineNumber = 'dependencies'.getLineIndexIn(lines);
  final RegExp regExp = RegExp(r'dependencies\s*{([^}]*)}');

  if (dependencyLineNumber.isLineNotExist()) {
    lines.add("dependencies {");
    lines.add(dependency.padLeft(dependency.length + 4));
    lines.add("}");
    gradleFile.file.writeAsStringSync(lines.join("\n"));
  } else {
    String content = gradleFile.content;

    if (regExp.hasMatch(content)) {
      content = content.replaceAllMapped(regExp, (Match match) {
        String existingDependencies = match.group(1)!.trim();

        if (existingDependencies.isEmpty) {
          return 'dependencies {\n${dependency.padLeft(dependency.length + 4)}\n}';
        }

        if (!existingDependencies.contains(dependency)) {
          return 'dependencies {\n${existingDependencies.padLeft(existingDependencies.length + 4)}\n${dependency.padLeft(dependency.length + 4)}\n}';
        }

        return match.group(0)!;
      });

      gradleFile.file.writeAsStringSync(content);
    }
  }
}
