import 'dart:io';
import 'package:smart_notification_manager/core/utils/line_helper.dart';
import 'package:smart_notification_manager/core/utils/line_index_helper.dart';
import 'package:smart_notification_manager/core/utils/manifest_file.dart';

void insertFullScreenPermissionToMainfest() {
  final String permission = '<uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT" />';
  final int manifestDeclarationLineNumber = '<manifest'.getLineIndexIn(ManifestFile().lines);

  if (manifestDeclarationLineNumber.isLineNotExist()) {
    print("manifest tag not exist");
    exit(0);
  }

  final int lineAfterManifestDeclaration = manifestDeclarationLineNumber + 1;
  final String formattedFullScreenPermission = permission.padLeft(
    permission.length + 4,
  );
  ManifestFile().lines.insert(lineAfterManifestDeclaration, formattedFullScreenPermission);
  ManifestFile().file.writeAsStringSync(ManifestFile().lines.join("\n"));
}
