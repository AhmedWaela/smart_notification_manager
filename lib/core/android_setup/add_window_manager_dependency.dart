import 'package:smart_notification_manager/core/utils/gradle_file.dart';
import 'package:smart_notification_manager/core/utils/line_helper.dart';

void addWindowManagerLibrary() {
  final List<String> libraries = [
    'implementation("androidx.window:window:1.0.0")',
    'implementation("androidx.window:window-java:1.0.0")',
  ];
  final int dependenciesLineNumber = "dependencies".getLineIndexIn(
    GradleFile().lines,
  );

  final bool isLibraryAdded = "androidx.window:window".existsInLines(
    GradleFile().lines,
  );
  final int libraryPaddingOne = libraries[0].length + 4;
  final int libraryPaddingTwo = libraries[1].length + 4;
  final String formattedDependencyLine1 = libraries[0].padLeft(
    libraryPaddingOne,
  );
  final String formattedDependencyLine2 = libraries[1].padLeft(
    libraryPaddingTwo,
  );
  final int firstLineInDependenciesScope = dependenciesLineNumber + 1;
  final int secondLineInDependenciesScope = dependenciesLineNumber + 2;
  if (!isLibraryAdded) {
    GradleFile().lines.insert(
      firstLineInDependenciesScope,
      formattedDependencyLine1,
    );
    GradleFile().lines.insert(
      secondLineInDependenciesScope,
      formattedDependencyLine2,
    );
    final String windowManagerContent = GradleFile().lines.join("\n");
    GradleFile().file.writeAsStringSync(windowManagerContent);
  }
}
