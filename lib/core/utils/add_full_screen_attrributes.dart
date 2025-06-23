import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void addFullScreenAttributes(bool isAttributesEnabled) {
  final List<String> attributes = [
    'android:showWhenLocked="true"',
    'android:turnScreenOn="true"',
  ];
  final line = "<activity".getLineIndexIn(ManifestFile().lines);
  if (line == -1) {
    print("Main activity not found in AndroidManifest.xml");
    return;
  }
  final isFullScreenAttributesAdded = ManifestFile().lines.any(
    (element) =>
        element.trim().contains("showWhenLocked") ||
        element.trim().contains("turnScreenOn"),
  );

  if (!isFullScreenAttributesAdded && isAttributesEnabled) {
    for (var i = 0; i < attributes.length; i++) {
      ManifestFile().lines.insert(
        line + 1 + i,
        attributes[i].padLeft(attributes[i].length + 12),
      );
    }
    ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
    print("Successfully added full screen attributes to AndroidManifest.xml");
  }
}
