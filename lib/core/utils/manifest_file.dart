import 'package:smart_notification_manager/core/utils/config_file.dart';
class ManifestFile extends ConfigFile {
  ManifestFile._() : super('android/app/src/main/AndroidManifest.xml');
  static final ManifestFile _instance = ManifestFile._();
  factory ManifestFile() => _instance;
}