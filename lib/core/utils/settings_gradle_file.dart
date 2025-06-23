import 'package:smart_notification_manager/core/utils/config_file.dart';

class SettingsGradleFile extends ConfigFile {
  SettingsGradleFile._() : super('android/settings.gradle.kts');
  static final SettingsGradleFile _instance = SettingsGradleFile._();
  factory SettingsGradleFile() => _instance;
}
