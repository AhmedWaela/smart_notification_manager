import 'package:smart_notification_manager/core/utils/constants.dart';
import 'package:smart_notification_manager/core/utils/gradle_file.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/line_index_helper.dart';

void addCoreLibraryDesugaringDependency() {
  final int line = Constants.dependencies.getLineIndexIn(GradleFile().lines);

  final String dependency = 'coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")';
  if (line.isLineNotExist()) {
    GradleFile().lines.add("dependencies {");
    GradleFile().lines.add(dependency.padLeft(dependency.length + 4));
    GradleFile().lines.add("}");
    final String content = GradleFile().lines.join("\n");
    GradleFile().file.writeAsStringSync(content);
  } else {
    String content = GradleFile().content;
    final RegExp dependenciesExp = RegExp(r'dependencies\s*{([^}]*)}');
    if (dependenciesExp.hasMatch(content)) {
      content = content.replaceAllMapped(dependenciesExp, (Match match) {
        String existingDependencies = match.group(1)!.trim();

        if (existingDependencies.isEmpty) {
          return 'dependencies {\n${dependency.padLeft(dependency.length + 4)}\n}';
        }

        if (!existingDependencies.contains(dependency)) {
          return 'dependencies {\n${existingDependencies.padLeft(existingDependencies.length + 4)}\n${dependency.padLeft(dependency.length + 4)}\n}';
        }

        return match.group(0)!;
      });

      GradleFile().file.writeAsStringSync(content);
    }
  }
}
