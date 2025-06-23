import 'package:smart_notification_manager/core/utils/config_file.dart';
class ProguardFile extends ConfigFile {
  ProguardFile._() : super('android/app/proguard.pro');
  static final ProguardFile _instance = ProguardFile._();
  factory ProguardFile() => _instance;
}