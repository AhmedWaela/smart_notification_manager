import 'package:smart_notification_manager/core/utils/config_file.dart';

class GradleFile extends ConfigFile {
  GradleFile._() : super('android/app/build.gradle.kts');
  static final GradleFile _instance = GradleFile._();
  factory GradleFile() => _instance;
}