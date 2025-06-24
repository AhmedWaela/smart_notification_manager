import 'package:smart_notification_manager/core/utils/settings_gradle_file.dart';

void checkAndUpdateGradleVersion() {
  final RegExp versionRegex = RegExp(
    r'id\("com\.android\.application"\)\s+version\s+"([\d.]+)"',
  );
  
  for (int i = 0; i < SettingsGradleFile().lines.length; i++) {
    final Match? match = versionRegex.firstMatch(SettingsGradleFile().lines[i]);
    if (match != null) {
      final String currentVersion = match.group(1)!;
      final List<int> currentVersionParts = currentVersion
          .split('.')
          .map(int.parse)
          .toList();
      final List<int> targetVersionParts = [8, 6, 0];

      bool isSmaller = false;
      for (int j = 0; j < targetVersionParts.length; j++) {
        if (j >= currentVersionParts.length ||
            currentVersionParts[j] < targetVersionParts[j]) {
          isSmaller = true;
          break;
        } else if (currentVersionParts[j] > targetVersionParts[j]) {
          isSmaller = false;
          break;
        }
      }

      if (isSmaller) {
        SettingsGradleFile().lines[i] = SettingsGradleFile().lines[i]
            .replaceFirst(currentVersion, '8.6.0');
      }
      break;
    }
  }
  final String content = SettingsGradleFile().lines.join('\n');
  SettingsGradleFile().file.writeAsStringSync(content);
}
